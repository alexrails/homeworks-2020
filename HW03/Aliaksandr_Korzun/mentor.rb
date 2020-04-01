class Mentor < User
  attr_accessor :homeworks, :students, :notifications

  def initialize(name, surname)
    super(name, surname)
    @students = []
    @notifications = []
    @homeworks = []
  end

  def show_all_students
    Student.all
  end

  def subscribe_to(student_surname)
    students << find_student(student_surname)
    find_student(student_surname).followers << self
  end

  def unsubscribe_to(student_surname)
    students >> find_student(student_surname)
    find_student(student_surname).followers >> self
  end

  def create_homework(number, task)
    homeworks << Homework.new(number, task)
  end

  def read_notifications!
    notifications.clear
  end

  private

  def find_student(student_surname)
    Student.find(student_surname)
  end

end
