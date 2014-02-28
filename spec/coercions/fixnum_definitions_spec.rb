require 'spec_helper'

describe Yukata::Coercions::FixnumDefinitions do
  let(:coercer) { Yukata::Coercer.new }
  let(:fixnum) { 1 }

  before do
    described_class.bind_to(coercer)
  end

  describe 'Fixnum to String' do
    subject { coercer.coerce(fixnum, String) }
    it 'coerces to a String' do
      expect(subject).to eq(fixnum.to_s)
    end
  end

  describe 'Fixnum to Time' do
    subject { coercer.coerce(fixnum, Time) }
    it 'coerces to a Time' do
      expect(subject).to eq(Time.at(fixnum))
    end
  end

  describe 'Fixnum to Date' do
    subject { coercer.coerce(fixnum, Date) }
    it 'coerces to a Date' do
      expect(subject).to eq(Time.at(fixnum).to_date)
    end
  end

  describe 'Fixnum to DateTime' do
    subject { coercer.coerce(fixnum, DateTime) }
    it 'coerces to a DateTime' do
      expect(subject).to eq(Time.at(fixnum).to_datetime)
    end
  end

  describe 'Fixnum to Integer' do
    subject { coercer.coerce(fixnum, Integer) }
    it 'coerces to a Integer' do
      expect(subject).to eq(fixnum.to_i)
    end
  end

  describe 'Fixnum to Float' do
    subject { coercer.coerce(fixnum, Float) }
    it 'coerces to a Float' do
      expect(subject).to eq(fixnum.to_f)
    end
  end
end
