# The provided files will be loaded when this file executes.
# Require any additional files that have been created.
require_relative 'html_whitespace_cleaner'
require_relative 'post'
require_relative 'comment'
require_relative 'hacker_news_parser.rb'

require 'nokogiri'
require 'open-uri'

# parsed_example_page = HackerNewsParser.new('html-samples/hacker-news-post.html')
# post = Post.new(parsed_example_page)
# post.print_post_with_comments

html_file = open('https://news.ycombinator.com/item?id=5003980')
live_page_parsed = HackerNewsParser.new(html_file)
live_page_post = Post.new(live_page_parsed)
live_page_post.print_post_with_comments







