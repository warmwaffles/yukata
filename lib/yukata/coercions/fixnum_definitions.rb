module Yukata
  module Coercions
    class FixnumDefinitions
      def self.bind_to(coercer)
        coercer.register(Fixnum, String)   { |obj, _| obj.to_s }
        coercer.register(Fixnum, Time)     { |obj, _| Time.at(obj) }
        coercer.register(Fixnum, Date)     { |obj, _| Time.at(obj).to_date }
        coercer.register(Fixnum, DateTime) { |obj, _| Time.at(obj).to_datetime }
        coercer.register(Fixnum, String)   { |obj, _| obj.to_s }
        coercer.register(Fixnum, Integer)  { |obj, _| obj.to_i }
        coercer.register(Fixnum, Float)    { |obj, _| obj.to_f }
      end
    end
  end
end
