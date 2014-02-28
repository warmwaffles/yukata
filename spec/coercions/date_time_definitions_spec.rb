require 'spec_helper'

describe Yukata::Coercions::DateTimeDefinitions do
  let(:coercer) { Yukata::Coercer.new }
  let(:date) { DateTime.new }

  before do
    described_class.bind_to(coercer)
  end

  describe 'DateTime to Time' do
    subject { coercer.coerce(date, Time) }
    it 'coerces to a Time' do
      expect(subject).to eq(date.to_time)
    end
  end

  describe 'DateTime to Date' do
    subject { coercer.coerce(date, Date) }
    it 'coerces to a Date' do
      expect(subject).to eq(date.to_date)
    end
  end

  describe 'DateTime to Integer' do
    subject { coercer.coerce(date, Integer) }
    it 'coerces to an Integer' do
      expect(subject).to eq(date.to_time.to_i)
    end
  end

  describe 'DateTime to Float' do
    subject { coercer.coerce(date, Float) }
    it 'coerces to a Float' do
      expect(subject).to eq(date.to_time.to_f)
    end
  end

  describe 'DateTime to String' do
    subject { coercer.coerce(date, String) }
    it 'coerces to a String' do
      expect(subject).to eq(date.to_s)
    end
  end
end
