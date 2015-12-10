require_relative 'comment'
class Post
  def initialize(args = {})
    @title = args.fetch[:title]
    @url = args.fetch[:url]
    @points = args.fetch[:points]
    @author_username = args.fetch[:author_username]
    @item_id = args.fetch[:item_id]
    @all_comment = []
  end

  def comments
   @all_comments
  end

  def add_comments(comment)
    @all_comment << comment
  end
end
