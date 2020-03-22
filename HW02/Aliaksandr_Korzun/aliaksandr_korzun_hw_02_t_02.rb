# frozen_string_literal: true

logs = 'logfile.txt'

IP_ADDRESS = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/.freeze
DATE_INFO = /\[.*\]/.freeze
PATH = /\".*\"/.freeze

def format_log_string(logs)
  file_data = File.readlines(logs).map(&:chomp)
                  .delete_if { |line| error?(line) }

  file_data.map do |line|
    (line.slice(DATE_INFO)[1..-2]).to_s + ' FROM ' \
    "#{line.slice(IP_ADDRESS)} " \
    "#{line.slice(PATH).gsub('POST', 'TO')[1..-2]}"
  end
end

private

def error?(line)
  line.downcase.include?('error')
end

p format_log_string(logs)
