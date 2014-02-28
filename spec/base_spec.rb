require 'spec_helper'

describe Yukata::Base do
  class MockedBase < Yukata::Base
    attribute :id,         Integer
    attribute :foo,        String
    attribute :created_at, DateTime, default: -> { DateTime.now }
  end

  describe '#initialize' do
    context 'when a hash is not passed' do
      subject { MockedBase.new }

      its(:id) { should be_nil }
      its(:foo) { should be_nil }
      its(:created_at) { should_not be_nil }
    end

    context 'when a hash is passed' do
      let(:now) { DateTime.now }
      let(:params) { { id: '1', foo: 'bar', created_at: now } }

      subject { MockedBase.new(params) }

      its(:id) { should eq(1) }
      its(:foo) { should eq('bar') }
      its(:created_at) { should eq(now) }
    end
  end
end
