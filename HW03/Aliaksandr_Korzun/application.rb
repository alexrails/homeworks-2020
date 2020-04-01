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

    mentor.create_homework(1, 'To do something cool')
    mentor.create_homework(2, 'To do somenthing again')

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
