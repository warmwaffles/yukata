unless defined?(Boolean)
  class Boolean
  end
end

module Yukata
  module Coercions
    class BooleanDefinitions
      def self.bind_to(coercer)
        coercer.register(TrueClass, String) { |o, _| 'true' }
        coercer.register(FalseClass, String) { |o, _| 'false' }
      end
    end
  end
end
