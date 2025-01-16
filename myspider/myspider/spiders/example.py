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
    start_urls = [
        'https://vnexpress.net/cong-an-tim-kiem-be-3-tuoi-bi-nguoi-la-dan-khoi-truong-mam-non-4839035.html'
    ]

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
            host="mysqlcontainer",  # This is the service name from docker-compose.yml
            user="root",             # MySQL username
            password="12345678",     # MySQL password
            database="demo_crawl"    # The database you defined
        )
        self.cursor = self.db.cursor()

        for url in self.start_urls:
            self.cursor.execute(
                """
                INSERT INTO crawler_pages (url, access_status)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE access_status=%s
                """,
                (url, 0, 0)
            )

    def parse(self, response):
        self.driver.get(response.url)
        wait = WebDriverWait(self.driver, 10)

        self.cursor.execute(
            """
            INSERT INTO crawler_pages (url, access_status)
            VALUES (%s, %s)
            ON DUPLICATE KEY UPDATE access_status=%s
            """,
            (response.url, 1, 1)
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
                INSERT INTO crawler_pages (url, access_status)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE access_status=%s
                """,
                (response.url, 3, 3)  # Đặt access_status = 0 cho URL đã tồn tại
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
                is_reply = "sub_comment_item" in item.get_attribute("class")
                
                nickname = item.find_element(By.CLASS_NAME, "nickname").text
                content_html = item.find_element(By.CLASS_NAME, "full_content").get_attribute('outerHTML')
                likes = item.find_element(By.CSS_SELECTOR, '.reactions-total .number').text or "0"
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
                    "likes": likes,
                    "time": time_text,
                    "is_reply": is_reply,
                    "reply_nickname": None,
                    "in_comment": None,
                }

                # if is_reply:
                #     parent_comment_item = item.find_element(By.XPATH, "./ancestor::div[contains(@class, 'comment_item')]")
                #     outer_nickname = parent_comment_item.find_element(By.CLASS_NAME, "nickname").text

                #     reply_name = item.find_element(By.CLASS_NAME, "reply_name").text or outer_nickname

                #     comment_data["reply_nickname"] = reply_name
                #     comment_data["in_comment"] = outer_nickname

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
                INSERT INTO crawler_pages (url, access_status)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE access_status=%s
                """,
                (crawler_url, 2, 2)
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