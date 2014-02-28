require 'spec_helper'

describe Yukata::Coercions::BooleanDefinitions do
  let(:coercer) { Yukata::Coercer.new }

  before do
    described_class.bind_to(coercer)
  end

  describe 'Boolean to String' do
    context 'when the value is false' do
      subject { coercer.coerce(false, String) }

      it 'returns "false"' do
        expect(subject).to eq('false')
      end
    end

    context 'when the value is true' do
      subject { coercer.coerce(true, String) }

      it 'return "true"' do
        expect(subject).to eq('true')
      end
    end
  end
end
