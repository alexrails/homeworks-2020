# frozen_string_literal: true

require_relative 'user'
require_relative 'student'
require_relative 'mentor'
require_relative 'pullrequest'
require_relative 'homework'
require_relative 'notification'

module App
  def self.run
    student = Student.new(name: 'John', surname: 'Doe')
    mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

    homework_first = Homework.new(1, 'To do something cool')
    homework_second = Homework.new(2, 'To do something again')

    mentor.create_homework(homework_first)
    mentor.create_homework(homework.second)

    pull_request_1 = PullRequest.new
    pull_request_2 = PullRequest.new

    student.create_pull_request!(pull_request_1, homework_number, code)
    student.pull_requests # => [Homework, ...]

    mentor.subscribe_to(student_surname)
    mentor.notifications # => []

    student.create_pull_request!(pull_request_2, homework_data, code)
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
end
