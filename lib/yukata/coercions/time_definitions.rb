module Yukata
  module Coercions
    class TimeDefinitions
      def self.bind_to(coercer)
        coercer.register(Time, Date)     { |obj, _| obj.to_date }
        coercer.register(Time, DateTime) { |obj, _| obj.to_datetime }
        coercer.register(Time, Integer)  { |obj, _| obj.to_i }
        coercer.register(Time, Float)    { |obj, _| obj.to_f }
        coercer.register(Time, String)   { |obj, _| obj.to_s }
      end
    end
  end
end
