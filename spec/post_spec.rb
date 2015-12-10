require_relative '../post'
require_relative '../parser'
require 'nokogiri'

# describe Post do

# let(:new_post) {Post.new(:title =>'All about Trees', :url => 'www.allabouttrees.com', :points => 34, :author_username => "jondoe.gmail.com", :item_id => 748)}

#   it 'should create a hash ' do
#       expect(Post.new).to be_a(Hash)
#     end

#   xit 'should contain a collection of comments' do
#       expect(post.comments).to be_a(Hash)
#     end

#   xit 'should be able to add new comments to the collection hash' do
#       expect(post.add_comments(  )).to
#     end
#   xit 'should create a hash with all needed info' do
#   end
# end

describe 'parser' do

 let(:test_1)  {Parser.new('html-samples/hacker-news-post.html')}

  it 'returns the second child element' do
    expect(test_1.parse_author_username).to eql('ankneo')
  end

  it 'returns the item id' do
    expect(test_1.parse_item_id).to eql(1070)
  end
  it 'should return all the comments' do
    expect(test_1.parse_all_comments).to be_a(String)
  end
end
