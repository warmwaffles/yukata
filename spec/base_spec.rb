require 'spec_helper'

describe Yukata::Base do
  class MockedBase < Yukata::Base
    attr_accessor :qux
    attribute :id,         Integer
    attribute :foo,        String
    attribute :created_at, Date, default: -> { Date.today }
  end

  let(:today) { Date.today }
  let(:params) { { id: '1', foo: 'bar', created_at: today, qux: 'doh' } }

  describe '#initialize' do
    context 'when a hash is not passed' do
      subject { MockedBase.new }

      it 'sets id to nil' do
        expect(subject.id).to be_nil
      end

      it 'sets foo to nil' do
        expect(subject.foo).to be_nil
      end

      it 'sets qux to nil' do
        expect(subject.qux).to be_nil
      end
    end

    context 'when a hash is passed' do
      subject { MockedBase.new(params) }

      it 'sets id to 1' do
        expect(subject.id).to eq(1)
      end

      it 'sets foo to "bar"' do
        expect(subject.foo).to eq('bar')
      end

      it 'sets qux to "doh"' do
        expect(subject.qux).to eq('doh')
      end

      it 'sets created_at to today' do
        expect(subject.created_at).to eq(today)
      end
    end
  end

  describe '#attributes' do
    subject { MockedBase.new(params).attributes }

    it 'contains the :id' do
      expect(subject[:id]).to eq(1)
    end

    it 'contains the :foo' do
      expect(subject[:foo]).to eq('bar')
    end

    it 'contains the :qux' do
      expect(subject[:qux]).to eq('doh')
    end

    it 'contains the :created_at' do
      expect(subject[:created_at]).to eq(today)
    end
  end
end
