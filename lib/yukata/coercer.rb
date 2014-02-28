module Yukata
  class Coercer
    def initialize
      @coercions = Hash.new do |hash, key|
        hash[key] = Hash.new { -> (object, type) { object } }
      end
      @mutex = Mutex.new
    end

    # Registers a coercion with the yukata library
    #
    # @param origin [Class] the class to convert
    # @param target [Class] what the origin will be converted to
    def register(origin, target, &block)
      @mutex.synchronize do
        @coercions[origin][target] = block
      end
    end

    # Removes a coercion from the library
    #
    # @param origin [Class]
    # @param target [Class]
    def unregister(origin, target)
      @mutex.synchronize do
        @coercions[origin].delete(target)
      end
    end

    # @param object [Object] the object to coerce
    # @param target [Class] what you want the object to turn in to
    def coerce(object, target)
      @mutex.synchronize do
        coercions = @coercions[object.class]
        key = coercions.keys.find { |k, _| k.ancestors.include?(target) }
        coercions[key].call(object, key)
      end
    end
  end
end
