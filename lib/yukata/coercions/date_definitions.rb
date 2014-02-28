module Yukata
  module Coercions
    class DateDefinitions
      def self.bind_to(coercer)
        coercer.register(Date, Time)     { |obj, _| obj.to_time }
        coercer.register(Date, DateTime) { |obj, _| obj.to_datetime }
        coercer.register(Date, Integer)  { |obj, _| obj.to_time.to_i }
        coercer.register(Date, Float)    { |obj, _| obj.to_time.to_f }
        coercer.register(Date, String)   { |obj, _| obj.to_s }
      end
    end
  end
end
