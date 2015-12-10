require 'nokogiri'
require_relative 'html_whitespace_cleaner'

class Parser
  def initialize(file)
    file = File.read(file)
    clean_file = HTMLWhitespaceCleaner.clean(file)
    @nokogiri_document = Nokogiri.parse(clean_file)
  end

  def parse_title
    @title = @nokogiri_document.css('.title').children[2].text
  end

  def parse_url
    @url = @nokogiri_document.css('.sitebit').text
  end

  def parse_points
    @points = @nokogiri_document.css('.score').text
  end

  def parse_author_username
    @author_username = @nokogiri_document.css('.subtext').children[2].text
  end

  def parse_item_id
    @item_id = @nokogiri_document.css('.subtext').children#.text
  end

  def parse_all_comments
    @all_comments = @nokogiri_document.css('.comment').text
     @all_comments.split("-----")[0]
  end

  def first_comment
    @first_comment = @nokogiri_document.css('.default').first
  end

 def author_comment
  @author_comment = @nokogiri_document.css('.comhead a:first-child')
  @author_comment.each do |author_object|
    Comment.new(author: author_object.text)
  end
 end

end



test_1 = Parser.new('html-samples/hacker-news-post.html')
# p test_1.first_comment.css('.comhead a:first-child')

p test_1.parse_title
p test_1.parse_url
p test_1.parse_author_username
p test_1.parse_points
p test_1.author_comment
p test_1.parse_all_comments



