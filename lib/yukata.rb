require 'json'

require 'yukata/version'
require 'yukata/errors'
require 'yukata/base'
require 'yukata/configuration'
require 'yukata/pool_configuration'
require 'yukata/abstract_connection'

module Yukata
  def self.configure
    @configuration = Yukata::Configuration.new
    yield(@configuration) if block_given?
    @configuration
  end

  def self.current_connection
    connection_lock.synchronize do
      return @current_connection if @current_connection
      @current_connection = @configuration.default_connection
    end
  end

  def self.set_connection(name)
    connection_lock.synchronize do
      @current_connection = @configuration.fetch_connection(name)
    end
  end

  private

  def self.connection_lock
    @connection_lock ||= Mutex.new
  end
end
