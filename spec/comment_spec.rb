require_relative '../comment'
require 'Time'
describe Comment do

let (:new_comment) {Comment.new(:author=> "Billy Bob", :created_at => Time.now, :all_comments => {})}

  it 'should create a new comment object with a Hash including author and created at'
    expect(Comment.new).to be_a(Hash)
end
