from scrapy.spiders import Spider
from scrapy.selector import Selector
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
import time

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

        self.driver = webdriver.Chrome(options=chrome_options)
        self.driver.set_page_load_timeout(180)

    def parse(self, response):
        self.driver.get(response.url)
        wait = WebDriverWait(self.driver, 10)

        try:
            wait.until(EC.presence_of_element_located((By.CLASS_NAME, "main_show_comment")))
        except Exception as e:
            self.logger.error("Không tìm thấy phần bình luận: %s", e)
            self.driver.quit()
            return # Lấy đối tượng Selenium WebDriver từ Scrapy-Selenium

        # 1. Nhấn "Xem thêm" cho đến khi không còn nút nào xuất hiện
        self.click_load_more(self.driver)

        # 2. Nhấn "Xem tất cả trả lời" cho từng bình luận
        self.click_view_all_replies(self.driver)

        # 3. Lấy toàn bộ bình luận và trả lời
        comments = self.extract_comments(self.driver)

        # 4. Yield dữ liệu
        for comment in comments:
            yield comment

    def click_load_more(self, driver):
        while True:
            try:
                view_more_button = WebDriverWait(driver, 10).until(
                    EC.element_to_be_clickable((By.CLASS_NAME, "view_more_coment"))
                )
                view_more_button.click()
                time.sleep(2)  
            except Exception as e:
                self.logger.info("Không còn nút 'Xem thêm bình luận': %s", e)
                break

    def click_view_all_replies(self, driver):
        """Nhấn 'Xem tất cả trả lời' để hiển thị hết các trả lời."""
        while True:
            try:
                # Lấy danh sách các nút "Xem tất cả trả lời"
                view_all_reply = WebDriverWait(driver, 10).until(
                    EC.element_to_be_clickable((By.CLASS_NAME, "view_all_reply"))
                )
                # Cuộn đến phần tử để đảm bảo nó không bị che khuất
                driver.execute_script("arguments[0].scrollIntoView({block: 'center'});", view_all_reply)
                time.sleep(1)  # Đảm bảo phần tử đã được cuộn vào vị trí
                # Nhấp vào nút
                view_all_reply.click()
                time.sleep(2)  
            except Exception as e:
                self.logger.info(f"Không tìm thấy nút 'Xem tất cả trả lời': {e}")
                break

    def extract_comments(self, driver):
        """Trích xuất dữ liệu bình luận và trả lời."""
        comments = []
        comment_items = driver.find_elements(By.CLASS_NAME, "comment_item")

        for item in comment_items:
            if "sub_comment_item" not in item.get_attribute("class"):
                try:
                    # Lấy dữ liệu bình luận chính
                    nickname = item.find_element(By.CLASS_NAME, "nickname").text
                    content = item.find_element(By.CLASS_NAME, "full_content").text
                    likes = item.find_element(By.CSS_SELECTOR, '.reactions-total .number').text or "0"
                    time_text = item.find_element(By.CLASS_NAME, "time-com").text

                    WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.CLASS_NAME, "sub_comment_item"))
                    )
                    replies = item.find_elements(By.CLASS_NAME, "sub_comment_item")
                    comments.append({
                        "nickname": nickname,
                        "content": content,
                        "likes": likes,
                        "time": time_text,
                        "is_reply": False,
                        "reply_nickname": None,
                        "in_comment": len(replies) > 0,
                    })

                except Exception as e:
                    self.logger.warning(f"Error extracting comment: {e}")
            else:
                try:
                    # Lấy dữ liệu bình luận chính
                    nickname = item.find_element(By.CLASS_NAME, "nickname").text
                    content = item.find_element(By.CLASS_NAME, "full_content").text
                    likes = item.find_element(By.CSS_SELECTOR, '.reactions-total .number').text or "0"
                    time_text = item.find_element(By.CLASS_NAME, "time-com").text

                    # Tìm phần tử cha có class="comment-item" từ một phần tử con
                    parent_comment_item = item.find_element(By.XPATH, "./ancestor::div[contains(@class, 'comment_item')]")

                    # Tìm nickname từ phần tử cha
                    outer_nickname = parent_comment_item.find_element(By.CLASS_NAME, "nickname").text

                    comments.append({
                        "nickname": nickname,
                        "content": content,
                        "likes": likes,
                        "time": time_text,
                        "is_reply": True,
                        "reply_nickname": outer_nickname,
                        "in_comment": True,
                    })
                except Exception as e:
                    self.logger.warning(f"Error extracting comment: {e}")
        return comments