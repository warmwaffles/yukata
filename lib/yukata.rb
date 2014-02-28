require 'json'

require 'yukata/version'
require 'yukata/errors'
require 'yukata/coercions'
require 'yukata/coercion'
require 'yukata/coercer'

module Yukata
  def self.coercer
    return @coercer if @coercer
    @coercer = Yukata::Coercer.new
    Yukata::Coercions.bind_to(@coercer)
    @coercer
  end

  def self.coercer=(coercer)
    @coercer = coercer
  end
end

require 'yukata/attribute'
require 'yukata/base'

