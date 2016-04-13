require 'spec_helper'
require 'log_entry'

describe LogEntry do
  describe '#initialize' do
    it 'exposes a url reader' do
      log_entry = described_class.new(url: 'foo', ip_address: 'bar')

      expect(log_entry.url).to eq('foo')
    end

    it 'exposes an ip_address reader' do
      log_entry = described_class.new(url: 'foo', ip_address: 'bar')

      expect(log_entry.ip_address).to eq('bar')
    end
  end
end
