module Yukata
  module Coercions
    class IntegerDefinitions
      def self.bind_to(coercer)
        coercer.register(Integer, Time)     { |obj, _| Time.at(obj) }
        coercer.register(Integer, Date)     { |obj, _| Time.at(obj).to_date }
        coercer.register(Integer, DateTime) { |obj, _| Time.at(obj).to_datetime }
        coercer.register(Integer, String)   { |obj, _| obj.to_s }
      end
    end
  end
end
