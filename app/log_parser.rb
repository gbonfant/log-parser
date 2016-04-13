require_relative 'log_entry'

class LogParser
  attr_reader :log_path, :log_entries

  def initialize(log_path)
    @log_path = log_path
    @log_entries = []
  end

  def parse_log_lines
    File.read(log_path).each_line do |line|
      create_log_entry(line)
    end
  end

  def grouped_urls
    @grouped_urls ||= log_entries.group_by { |entry| entry.url }
  end

  def order_urls_by_visits
    grouped_urls.map { |url, entries| [url, entries.count] }.
      sort { |a, b| b.last <=> a.last }
  end

  def order_urls_by_unique_visits
    grouped_urls.map { |key, value| [key, value.map(&:ip_address).uniq.count] }.
      sort { |a, b| b.last <=> a.last }
  end

  private

  def create_log_entry(line)
    url, ip = line.split

    @log_entries << LogEntry.new(url: url, ip_address: ip)
  end
end
