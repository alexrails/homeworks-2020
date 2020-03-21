logs = 'logfile.txt'

def find_error_logs(logs)
  File.foreach(logs) do |line|
    puts line if line.downcase.include?('error')
  end
end

find_error_logs(logs)
