require 'spec_helper'

describe Yukata::AbstractConnection do
  class MockedConnection < Yukata::AbstractConnection
    def build_connection
      Object.new
    end
  end

  let(:config) { { foo: 'bar' } }
  let(:mocked_connection) { MockedConnection.new(config) }
  let(:connection) { described_class.new(config) }

  describe '#configure_pool' do
    subject do
      mocked_connection.configure_pool do |config|
        config.timeout = 1
        config.size = 1
      end
    end

    it 'sets the config timeout' do
      expect(subject.timeout).to eq(1)
    end

    it 'sets the config size' do
      expect(subject.size).to eq(1)
    end
  end

  describe '#pool' do
    subject { mocked_connection.pool }
    it 'returns a ConnectionPool' do
      expect(subject).to be_a(ConnectionPool)
    end
  end

  describe '#config' do
    subject { connection.config }
    it 'returns the config' do
      expect(subject).to eq(config)
    end
  end

  describe '#build_connection' do
    subject { connection.build_connection }

    it 'raises a RuntimeError with a "not implemented" message' do
      expect { subject }.to raise_error(RuntimeError, /not implemented/)
    end
  end

  describe '#get' do
    subject { connection.get('somekey') }

    it 'raises a RuntimeError with a "not implemented" message' do
      expect { subject }.to raise_error(RuntimeError, /not implemented/)
    end
  end

  describe '#store' do
    subject { connection.store('somekey', {}) }

    it 'raises a RuntimeError with a "not implemented" message' do
      expect { subject }.to raise_error(RuntimeError, /not implemented/)
    end
  end

  describe '#delete' do
    subject { connection.delete('somekey') }

    it 'raises a RuntimeError with a "not implemented" message' do
      expect { subject }.to raise_error(RuntimeError, /not implemented/)
    end
  end
end
