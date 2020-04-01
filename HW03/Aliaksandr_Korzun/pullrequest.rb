class PullRequest
  attr_accessor :author, :code
  attr_reader :homework_number

  def initialize(author, homework, code)
    @author = author
    @homework = homework
    @code = code
  end
end
