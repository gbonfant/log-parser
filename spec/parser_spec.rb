require 'spec_helper'
require 'parser'

describe Parser do
  let(:parser) { Parser.new('logs/webserver.log') }

  describe '#parse_log_lines' do
    it 'iterates over the log lines and instantiates a LogEntry per line' do
      parser.parse_log_lines

      expect(parser.log_entries.size).to eq(500)
      expect(parser.log_entries).to include(LogEntry)
    end
  end
end
