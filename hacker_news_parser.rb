require 'nokogiri'

class HackerNewsParser
  attr_reader :nokogiri_document

  def initialize(file_path)
    @nokogiri_document = html_to_nokogiri_doc(file_path)
  end

  def html_to_nokogiri_doc(file_path)
    html = File.read(file_path)
    clean_html = HTMLWhitespaceCleaner.clean(html)
    nokogiri_doc = Nokogiri.parse(clean_html)
    return nokogiri_doc
  end

  def post_title
    title = @nokogiri_document.css('.title > a').inner_text
  end

  def post_id
    hacker_news_id =  @nokogiri_document.css('center > a').first.attributes['id'].value
  end

  def post_url
    url = @nokogiri_document.css('.title > a').first['href']
  end

  def post_author
    author = @nokogiri_document.css('.subtext > a').first.inner_text
  end

  def post_points
    points = @nokogiri_document.css('.subtext > .score').inner_text
  end

  def comments
    comments_arr = []
    comments = @nokogiri_document.css('span.comment')
    comments.each{ |comment| comments_arr << comment.text.chomp("-----") }
    comments_arr
  end

  def comment_authors
    authors_arr = []
    authors = @nokogiri_document.css('span.comhead > a:first-child')
    authors.each { |author| authors_arr << author.text }
    authors_arr
  end

end
