module Yukata
  module Coercions
    class StringDefinitions
      def self.bind_to(coercer)
        # Attempt to parse the date. If it can't be parsed just return nil.
        # Silently failing is about the only thing I can think of.
        type_parser = -> (obj, target) do
          begin
            target.parse(obj)
          rescue ArgumentError
            nil
          end
        end

        coercer.register(String, Time, &type_parser)
        coercer.register(String, Date, &type_parser)
        coercer.register(String, DateTime, &type_parser)
        coercer.register(String, Integer)  { |obj, _| obj.to_i }
        coercer.register(String, Float) { |obj, _| obj.to_f }
        coercer.register(String, Boolean) do |string, _|
          %w(1 on t true y yes).include?(string.downcase)
        end
      end
    end
  end
end
