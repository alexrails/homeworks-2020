# frozen_string_literal: true

require 'time'

logs = 'logfile_task_3.txt'

SUBSTRING = 'calling core'
TIME_TEMPLATE = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{1}/.freeze

def duration_of_actions(logs)
  result_hash = {}

  # Create array of logs
  file_data = File.readlines(logs).map(&:chomp)
                  .delete_if { |line| core?(line) }

  return 0 if file_data.size < 2

  # Fill in hash
  file_data.each.with_index do |line, index|
    if index < file_data.size - 1
      first_action = last_word(line)
      start = parse_time(line)

      next_line = file_data[index + 1]
      second_action = last_word(next_line)
      finish = parse_time(next_line)

      result_hash["#{first_action}->#{second_action}"] = (finish - start).to_s
    end
  end
  result_hash
end

private

# Find substring
def core?(line)
  !line.downcase.include?(SUBSTRING)
end

# Parsing time
def parse_time(line)
  Time.parse(line[TIME_TEMPLATE])
end

# Find last word to string
def last_word(line)
  line.split.last
end

p duration_of_actions(logs)

# Output: {"event->messages"=>"49.1", "messages->create"=>"40.0"}
