require 'json'

require 'yukata/version'
require 'yukata/coercer'

module Yukata
  def self.coercer
    @coercer ||= Yukata::Coercer.new
  end
end

require 'yukata/attribute'
require 'yukata/base'
require 'yukata/coercions'
