require 'yukata/errors'

module Yukata
  class Configuration
    def initialize
      @connections = Hash.new
    end

    # @param name [Symbol,String]
    # @param connection [Yukata::AbstractConnection]
    def use(name, connection)
      @default = name unless @default
      @connections[name] = connection
    end

    # @param name [Symbol,String]
    # @return [Yukata::AbstractConnection]
    def remove(name)
      @connections.delete(name) { raise(KeyError) }
    end

    # @param name [Symbol,String]
    # @raise [KeyError] if the name is not valid
    # @return [Yukata::AbstractConnection]
    def fetch_connection(name)
      @connections.fetch(name)
    end

    def default
      @default
    end

    def default=(name)
      raise(Yukata::ConfigError) unless @connections.include?(name)
      @default = name
    end

    def default_connection
      raise(Yukata::ConfigError) unless @default
      @connections[@default]
    end
  end
end