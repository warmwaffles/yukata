module Yukata
  # This wraps the block that is provided when you register a coercion.
  #
  # @author Matthew A. Johnston
  class Coercion
    # Just passes the object on through
    PASS_THROUGH = ->(obj, _) { obj }

    # @param origin [Class] the class that the object is
    # @param target [Class] the class you wish to coerce to
    def initialize(origin, target, &block)
      @origin  = origin
      @target  = target
      @block   = block_given? ? block : PASS_THROUGH
    end

    # Calls the coercion
    #
    # @return [Object]
    def call(object)
      @block.call(object, @target)
    end
  end
end
