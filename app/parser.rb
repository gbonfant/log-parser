class Parser
  attr_reader :log_file, :log_entries

  def initialize(log_file)
    @log_file = log_file
    @log_entries = []
  end

  def parse_log_lines
    File.read(log_file).each_line do |line|
      create_log_entry(line)
    end
  end

  private

  def create_log_entry(line)
    url, ip = line.split

    @log_entries << LogEntry.new(url: url, ip_address: ip)
  end
end

class LogEntry
  attr_reader :url, :ip_address

  def initialize(url:, ip_address:)
    @url = url
    @ip_address = ip_address
  end
end
