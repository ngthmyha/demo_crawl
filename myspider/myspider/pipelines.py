# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter
import pymysql
from scrapy.exceptions import NotConfigured
from myspider.items import UserCommentItem, CrawlerResultItem


class MyspiderPipeline:
    def process_item(self, item, spider):
        return item

    def open_spider(self, spider):
        self.db = pymysql.connect(
            host="mysqlcontainer",  # This is the service name from docker-compose.yml
            user="root",             # MySQL username
            password="12345678",     # MySQL password
            database="demo_crawl"    # The database you defined
        )
        self.cursor = self.db.cursor()

    def close_spider(self, spider):
        self.cursor.close()
        self.db.close()

    def process_item(self, item, spider):
        if isinstance(item, UserCommentItem):
            # Chèn vào bảng `user_comments`
            sql = """
                INSERT INTO user_comments (nickname, content, likes, time, is_reply, reply_nickname, in_comment)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """
            self.cursor.execute(sql, (
                item['nickname'],
                item['content'],
                item['likes'],
                item['time'],
                item['is_reply'],
                item['reply_nickname'],
                item['in_comment']
            ))
        elif isinstance(item, CrawlerResultItem):
            # Chèn vào bảng `crawler_results`
            sql = """
                INSERT INTO crawler_results (crawler_url, total_comments)
                VALUES (%s, %s)
                ON DUPLICATE KEY UPDATE total_comments = %s
            """
            self.cursor.execute(sql, (
                item['crawler_url'],
                item['total_comments'],
                item['total_comments']
            ))

        # Commit thay đổi vào database
        self.db.commit()
        return item
