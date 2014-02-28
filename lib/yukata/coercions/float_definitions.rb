module Yukata
  module Coercions
    class FloatDefinitions
      def self.bind_to(coercer)
        coercer.register(Float, Time)     { |obj, _| Time.at(obj) }
        coercer.register(Float, Date)     { |obj, _| Time.at(obj).to_date }
        coercer.register(Float, DateTime) { |obj, _| Time.at(obj).to_datetime }
        coercer.register(Float, String)   { |obj, _| obj.to_s }
        coercer.register(Float, Integer)  { |obj, _| obj.to_i }
      end
    end
  end
end
