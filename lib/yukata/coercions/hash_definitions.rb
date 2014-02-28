module Yukata
  module Coercions
    class HashDefinitions
      def self.bind_to(coercer)
        coercer.register(Hash, String) { |obj, _| obj.to_s }
        coercer.register(Hash, Array)  { |obj, _| obj.to_a }
      end
    end
  end
end
