require 'virtus'

module Yukata
  class Base
    include Virtus.model

    attr_accessor :key, :ttl, :persisted

    def self.find(key)
      obj = new({key: key})
      obj.reload
      obj
    end

    def self.create(params={})
      obj = new(params)
      obj.save
      obj
    end

    def initialize(params={})
      @key = params.delete(:key)
      @ttl = params.delete(:ttl)
      @persisted = false
      super(params)
    end

    def to_json(*)
      attributes.to_json
    end

    def reload(connection=Yukata.current_connection)
      self.attributes = connection.get(@key)
      @persisted = true
    end

    def save(connection=Yukata.current_connection)
      connection.store(@key, self)
      @persisted = true
    end
    alias_method(:update, :save)

    def destroy(connection=Yukata.current_connection)
      connection.destroy(@key)
      @persisted = false
    end

    def persisted?
      !!@persisted
    end
  end
end