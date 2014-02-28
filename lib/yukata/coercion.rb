module Yukata
  # @author Matthew A. Johnston
  class Coercion
    # Just passes the object on through
    PASS_THROUGH = ->(obj, _) { obj }

    def initialize(origin, target, &block)
      @origin  = origin
      @target  = target
      @block   = block_given? ? block : PASS_THROUGH
    end

    def call(object)
      @block.call(object, @target)
    end
  end
end
