require 'connection_pool'
require 'yukata/pool_configuration'

module Yukata
  # @author Matthew A. Johnston
  class AbstractConnection
    # @param config [Hash]
    def initialize(config={})
      @config = config
    end

    # @return [Yukata::PoolConfiguration]
    def configure_pool
      @pool_configuration = Yukata::PoolConfiguration.new
      yield(@pool_configuration) if block_given?
      @pool_configuration
    end

    # @raise [RuntimeError] if not implemented
    def build_connection
      raise(RuntimeError, '#build_connection not implemented')
    end

    # @raise [RuntimeError] if not implemented
    def get(*)
      raise(RuntimeError, '#get not implemented')
    end

    # @raise [RuntimeError] if not implemented
    def store(*)
      raise(RuntimeError, '#store not implemented')
    end

    # @raise [RuntimeError] if not implemented
    def delete(*)
      raise(RuntimeError, '#delete not implemented')
    end

    # @return [ConnectionPool]
    def pool
      @pool ||= ConnectionPool.new(@pool_configuration.to_h, &method(:build_connection))
    end

    # @return [Hash]
    def config
      @config.dup
    end
  end
end