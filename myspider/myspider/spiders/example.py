from scrapy.spiders import Spider
from scrapy.selector import Selector
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from bs4 import BeautifulSoup
import time
import pymysql
from datetime import datetime

class ExampleSpider(Spider):
    name = "example"
    allowed_domains = ["vnexpress.net"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        chrome_options = Options()
        chrome_options.add_argument("--headless") 
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--no-sandbox")

        # self.driver = webdriver.Chrome(options=chrome_options)
        self.driver = webdriver.Remote(
            command_executor="http://selenium:4444/wd/hub",
            options=chrome_options
        )
        self.driver.set_page_load_timeout(180)

        # Initialize database connection
        self.db = pymysql.connect(
            host="mysqlcontainer",
            user="root",      
            password="12345678",   
            database="demo_crawl"   
        )
        self.cursor = self.db.cursor()

        self.cursor.execute("SELECT url FROM crawler_pages WHERE access_status = 0") 
        self.start_urls = [row[0] for row in self.cursor.fetchall()]
        if not self.start_urls:
            print("Không có URL nào để crawl.")

    def parse(self, response):
        self.driver.get(response.url)
        wait = WebDriverWait(self.driver, 10)

        self.cursor.execute(
            """
            UPDATE crawler_pages 
            SET access_status = 1
            WHERE url = %s
            """,
            (response.url,)
        )

        try:
            wait.until(EC.presence_of_element_located((By.CLASS_NAME, "main_show_comment")))

            # 1. Nhấn "Xem thêm" cho đến khi không còn nút nào xuất hiện
            self.click_load_more(self.driver)

            # 2. Nhấn "Xem tất cả trả lời" cho từng bình luận
            self.click_view_all_replies(self.driver)

            # 3. Lấy toàn bộ bình luận và trả lời
            comments = self.extract_comments(self.driver)

            self.save_to_database(response.url, comments)
            for comment in comments:
                yield(comment)

        except Exception as e:
            self.cursor.execute(
                """
                UPDATE crawler_pages 
                SET access_status = 3
                WHERE url = %s
                """,
                (response.url,)
            )

            self.logger.error("Không tìm thấy phần bình luận: %s", e)
            self.driver.quit()
            return

    def click_load_more(self, driver):
        while True:
            try:
                view_more_button = driver.find_element(By.ID, "show_more_coment")
                if view_more_button.is_displayed() and view_more_button.is_enabled():
                    view_more_button.click()
                    time.sleep(2)
                else:
                    break 
            except Exception as e:
                self.logger.info("Không còn nút 'Xem thêm bình luận': %s", e)
                break

    def click_view_all_replies(self, driver):
        """Nhấn 'Xem tất cả trả lời' để hiển thị hết các trả lời."""
        while True:
            try:
                view_all_reply = WebDriverWait(driver, 10).until(
                    EC.element_to_be_clickable((By.CLASS_NAME, "view_all_reply"))
                )
                driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", view_all_reply)
                time.sleep(1)  
                view_all_reply.click()
                time.sleep(2)  
            except Exception as e:
                self.logger.info(f"Không tìm thấy nút 'Xem tất cả trả lời': {e}")
                break

    def extract_comments(self, driver):
        comments = []
        comment_items = driver.find_elements(By.CLASS_NAME, "comment_item")

        for item in comment_items:
            try:
                nickname = item.find_element(By.CLASS_NAME, "nickname").text
                content_html = item.find_element(By.CLASS_NAME, "full_content").get_attribute('outerHTML')
                time_text = item.find_element(By.CLASS_NAME, "time-com").text

                soup = BeautifulSoup(content_html, 'html.parser')
                
                for span in soup.find_all('span'):
                    span.decompose() 
                for a in soup.find_all('a'):
                    a.decompose() 

                content = soup.get_text(separator=' ', strip=True) or ""

                content = content.lstrip(": ")

                comment_data = {
                    "crawler_url": driver.current_url or "",
                    "nickname": nickname,
                    "content": content,
                    "time": time_text,
                }

                comments.append(comment_data)

            except Exception as e:
                self.logger.warning(f"Error extracting comment: {e}")

        return comments

    def save_to_database(self, crawler_url, comments):
        """Save extracted comments and crawler results to the database."""
        try:
            self.cursor.execute(
                """
                SELECT id FROM crawler_pages WHERE url = %s
                """,
                (crawler_url,)
            )
            crawler_page_id = self.cursor.fetchone()[0]
            # Insert crawler result
            self.cursor.execute(
                """
                UPDATE crawler_pages 
                SET access_status = 2
                WHERE url = %s
                """,
                (crawler_url,)
            )
            # Insert user comments
            for comment in comments:
                if len(comment["time"].split("/")) == 2:  # Không có năm
                    time_of_participation = datetime.strptime(comment["time"], "%H:%M %d/%m")
                    current_year = datetime.now().year
                    time_of_participation = time_of_participation.replace(year=current_year)
                else:  # Có năm
                    time_of_participation = datetime.strptime(comment["time"], "%H:%M %d/%m/%Y")
                self.cursor.execute(
                    """
                    INSERT INTO user_comments (nickname, time_of_participation)
                    VALUES (%s, %s)
                    """,
                    (
                        comment["nickname"],
                        time_of_participation 
                    )
                )

                # Lấy ID của bình luận đã được lưu
                user_comment_id = self.cursor.lastrowid

                # Lưu vào bảng crawler_results
                self.cursor.execute(
                    """
                    INSERT INTO crawler_results (crawler_page_id, crawl_url, user_comment_id, content)
                    VALUES (%s, %s, %s, %s)
                    """,
                    (
                        crawler_page_id, 
                        crawler_url,
                        user_comment_id,
                        comment["content"]
                    )
                )

            # Commit the transaction
            self.db.commit()

        except Exception as e:
            self.logger.error(f"Error saving to database: {e}")
            self.db.rollback()

    def closed(self, reason):
        try:
            if self.driver:
                self.driver.quit()
        except Exception as e:
            self.logger.warning(f"Error while quitting driver: {e}")
        finally:
            self.cursor.close()
            self.db.close()