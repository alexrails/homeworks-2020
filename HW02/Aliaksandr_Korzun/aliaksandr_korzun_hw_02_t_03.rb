# frozen_string_literal: true

require 'time'

LOG_FILE = 'logfile_task_3.txt'

SUBSTRING = 'calling core'
TIME_TEMPLATE = /^\d{4}\-\d{2}\-\d{2}\s\d{2}\:\d{2}\:\d{2}\.\d{1}/.freeze

def duration_of_actions(logs)
  result_hash = {}

  # Create array of logs
  file_data = File.readlines(logs).map(&:chomp)
                  .delete_if { |line| core?(line) }

  return 0 if file_data.size < 2

  # Fill in hash
  file_data.each_cons(2) do |item|
    first_action = last_word(item.first)
    start = parse_time(item.first)

    second_action = last_word(item.last)
    finish = parse_time(item.last)

    result_hash["#{first_action}->#{second_action}"] = (finish - start).to_s
  end
  result_hash
end

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

p duration_of_actions(LOG_FILE)

# Output: {"event->messages"=>"49.1", "messages->create"=>"40.0"}
