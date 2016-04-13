require 'spec_helper'
require 'log_parser'

describe LogParser do
  let(:parser) { described_class.new('foo/path') }

  describe '#parse_log_lines' do
    it 'iterates over the log lines and instantiates a LogEntry per line' do
      allow(File).to receive(:read).and_return(simple_log)
      parser.parse_log_lines

      expect(parser.log_entries.size).to eq(2)
      expect(parser.log_entries).to include(LogEntry)
    end

    describe '#grouped_urls' do
      it 'groups all the log entries by url' do
        allow(File).to receive(:read).and_return(simple_log)
        parser.parse_log_lines

        grouped_urls = parser.grouped_urls

        expect(grouped_urls).to include('url', 'url_2')
      end
    end

    describe '#order_urls_by_visits' do
      it 'orders the urls by number of visits' do
        allow(File).to receive(:read).and_return(multi_url_log)
        parser.parse_log_lines

        webpage_views = parser.order_urls_by_visits

        expect(webpage_views).to eq([["url", 2], ["url_2", 2]])
      end
    end

    describe '#order_urls_by_unique_visits' do
      it 'orders the urls by unique number of visits' do
        allow(File).to receive(:read).and_return(multi_url_log)
        parser.parse_log_lines

        webpage_views = parser.order_urls_by_unique_visits

        expect(webpage_views).to eq([["url", 2], ["url_2", 1]])
      end
    end
  end

  def simple_log
    "url ip_address\nurl_2 ip_address_2"
  end

  def multi_url_log
    "url ip_address\nurl_2 ip_address_2\nurl ip_address3\nurl_2 ip_address_2"
  end
end
