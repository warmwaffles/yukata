require 'spec_helper'

describe Yukata::Coercions::DateDefinitions do
  let(:coercer) { Yukata::Coercer.new }
  let(:date) { Date.today }

  before do
    described_class.bind_to(coercer)
  end

  describe 'Date to Time' do
    subject { coercer.coerce(date, Time) }
    it 'coerces to a Time' do
      expect(subject).to eq(date.to_time)
    end
  end

  describe 'Date to DateTime' do
    subject { coercer.coerce(date, DateTime) }
    it 'coerces to a DateTime' do
      expect(subject).to eq(date.to_datetime)
    end
  end

  describe 'Date to Integer' do
    subject { coercer.coerce(date, Integer) }
    it 'coerces to an Integer' do
      expect(subject).to eq(date.to_time.to_i)
    end
  end

  describe 'Date to Float' do
    subject { coercer.coerce(date, Float) }
    it 'coerces to a Float' do
      expect(subject).to eq(date.to_time.to_f)
    end
  end

  describe 'Date to String' do
    subject { coercer.coerce(date, String) }
    it 'coerces to a String' do
      expect(subject).to eq(date.to_s)
    end
  end
end
