require 'spec_helper'

describe Yukata::Base do
  class MockedModel < Yukata::Base
    attribute(:foo, String)
    attribute(:date, DateTime)
  end

  class MockedConnection < Yukata::AbstractConnection
    def initialize(config={})
      super(config)
      @memory = Hash.new
    end

    def build_connection
      Object.new
    end

    def get(key)
      value = @memory[key]
      if value
        JSON.parse(value)
      else
        raise(Yukata::ResourceNotFoundError, "#{key} was not found")
      end
    end

    def store(key, object)
      @memory[key] = object.to_json
    end

    def delete(key)
      @memory.delete(key)
    end
  end

  let(:now) { Date.today }
  let(:base) { described_class.new }
  let(:mocked_model) { MockedModel.new({foo: 'bar', date: now}) }
  let(:connection) { MockedConnection.new }

  before { Yukata.stub(current_connection: connection) }

  describe '.find' do
    context 'when the key is not present' do
      it 'raises a Yukata::ResourceNotFoundError' do
        expect { MockedModel.find('test-key') }.to raise_error(Yukata::ResourceNotFoundError)
      end
    end

    context 'when the key is present' do
      before { connection.store('test-key', mocked_model) }
      subject { MockedModel.find('test-key') }

      it 'returns a MockedModel' do
        expect(subject).to be_a(MockedModel)
      end

      it 'has #foo set' do
        expect(subject.foo).to eq('bar')
      end

      it 'has #date set' do
        expect(subject.date).to eq(now)
      end
    end
  end

  describe '.create' do
    before { MockedModel.create({key: 'test-key', foo: 'baz'}) }

    it 'stores the model' do
      expect(connection.get('test-key')).to eq('date' => nil, 'foo' => 'baz')
    end
  end

  describe '#reload'
  describe '#save'
  describe '#destroy'
  describe '#persisted?'
end
