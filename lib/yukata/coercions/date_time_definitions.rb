module Yukata
  module Coercions
    class DateTimeDefinitions
      def self.bind_to(coercer)
        coercer.register(DateTime, Time)     { |obj, _| obj.to_time }
        coercer.register(DateTime, Date)     { |obj, _| obj.to_date }
        coercer.register(DateTime, Integer)  { |obj, _| obj.to_time.to_i }
        coercer.register(DateTime, Float)    { |obj, _| obj.to_time.to_f }
        coercer.register(DateTime, String)   { |obj, _| obj.to_s }
      end
    end
  end
end
