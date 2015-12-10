class Comment

  def initialize(args = {})
    @author = args.fetch[:author]

  end
end
