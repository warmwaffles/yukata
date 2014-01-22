module Yukata
  class PoolConfiguration
    attr_accessor :size, :timeout

    def initialize
      @size = 5
      @timeout = 5
    end

    def to_h
      {
        size: @size,
        timeout: @timeout
      }
    end
  end
end