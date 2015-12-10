# The provided files will be loaded when this file executes.
# Require any additional files that have been created.
require_relative 'html_whitespace_cleaner'
require_relative 'post'
require_relative 'comment'

require 'nokogiri'
load 'html_whitespace_cleaner.rb'
html = File.read('html-samples/example.html')
clean_html = HTMLWhitespaceCleaner.clean(html)

