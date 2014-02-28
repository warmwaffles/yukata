module Yukata
  class Coercer
    def initialize
      @coercions = Hash.new do |hash, origin|
        hash[origin] = Hash.new do |h, target|
          h[target] = Coercion.new(origin, target)
        end
      end
      @mutex = Mutex.new
    end

    # Registers a coercion with the yukata library
    #
    # @param origin [Class] the class to convert
    # @param target [Class] what the origin will be converted to
    def register(origin, target, &block)
      raise(ArgumentError, 'block is required') unless block_given?

      @mutex.synchronize do
        @coercions[origin][target] = Coercion.new(origin, target, &block)
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
      @coercions[object.class][target].call(object)
    end
  end
end
