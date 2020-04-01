class Homework
  attr_reader :number, :task

  @@homeworks = {}

  def self.find(number)
    @@homeworks[number]
  end

  def initialize(number, task)
    @number = number
    @task = task
    @@homeworks[number] = self
  end

  def to_s
    "Homework #{self.number}: #{self.task}"
  end

end
