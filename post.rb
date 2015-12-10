class Post

  def initialize(parsed_html_object)
    @title = parsed_html_object.post_title
    @url = parsed_html_object.post_url
    @points = parsed_html_object.post_points
    @author_username = parsed_html_object.post_author
    @item_id = parsed_html_object.post_id
    @comments = parsed_html_object.comments
    @comment_authors = parsed_html_object.comment_authors
  end


  def comments
    puts "\n\tComments:"
    @comments.each_with_index do |comment, index|
      puts "\n" + comment
      puts "\t-" + @comment_authors[index]
    end
  end

  def add_comment(comment, author)
    @comments << comment
    @comment_authors << author
  end

  def print_post_with_comments
    puts
    print @title + "(Hacker News ID:)" + @item_id +"\n"
    puts "\tURL: " + @url
    puts "\tAuthor: " + @author_username
    puts "\tPoints: " + @points
    puts
    comments
  end

end
