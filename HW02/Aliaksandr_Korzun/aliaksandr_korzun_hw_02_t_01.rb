# frozen_string_literal: true

LOG_FILE = 'logfile.txt'
TEMPLATE = /error/
def find_error_logs(logs)
  File.readlines(logs).select{ |line| line =~ TEMPLATE }.first
end

p find_error_logs(LOG_FILE)
