# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class MyspiderItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class UserCommentItem(scrapy.Item):
    nickname = scrapy.Field()
    content = scrapy.Field()
    likes = scrapy.Field()
    time = scrapy.Field()
    is_reply = scrapy.Field()
    reply_nickname = scrapy.Field()
    in_comment = scrapy.Field()

class CrawlerResultItem(scrapy.Item):
    crawler_url = scrapy.Field()
    total_comments = scrapy.Field()