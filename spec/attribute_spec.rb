require 'spec_helper'

describe Yukata::Attribute do
  describe '#initialize' do
    context 'when the default is a proc' do
      subject { Yukata::Attribute.new(String, { default: -> { 'nothing' } }) }
      it 'sets the default' do
        expect(subject.default).to eq('nothing')
      end
    end

    context 'when the default is a String' do
      subject { Yukata::Attribute.new(String, { default: 'nothing' }) }
      it 'sets the default' do
        expect(subject.default).to eq('nothing')
      end
    end

    context 'when no default is provided' do
      subject { Yukata::Attribute.new(String) }
      it 'sets the default to nil' do
        expect(subject.default).to eq(nil)
      end
    end
  end
end
