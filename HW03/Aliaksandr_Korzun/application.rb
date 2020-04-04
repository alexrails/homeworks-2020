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

    student.create_pull_request!(homework_number, code)
    student.pull_requests # => [Homework, ...]

    mentor.subscribe_to(student_surname)
    mentor.notifications # => []

    student.create_pull_request!(homework_data)
    mentor.notifications # => [Notification, ...]

    mentor.read_notifications!
    mentor.notifications # => []
  end
end
