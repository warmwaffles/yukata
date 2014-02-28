require 'spec_helper'

describe Yukata::Coercion do
  describe '#initialize' do
    context 'when no block is provided' do
      subject { Yukata::Coercion.new(Object, String) }
      it 'becomes a pass through coercion' do
        test = double('SomeObject')
        expect(subject.call(test)).to eq(test)
      end
    end
    context 'when a block is provided' do
      subject { Yukata::Coercion.new(Object, String) { |o,_| o.to_s } }

      it 'sets the block to the one that is provided' do
        test = double('SomeObject', to_s: 'something')
        expect(subject.call(test)).to eq('something')
      end
    end
  end
end
