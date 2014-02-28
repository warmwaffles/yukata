require 'json'

require 'yukata/version'
require 'yukata/errors'
require 'yukata/coercion'
require 'yukata/coercer'

module Yukata
  def self.coercer
    @coercer ||= Yukata::Coercer.new
  end
end

require 'yukata/attribute'
require 'yukata/base'

require 'yukata/coercions/date'
require 'yukata/coercions/date_time'
require 'yukata/coercions/fixnum'
require 'yukata/coercions/float'
require 'yukata/coercions/integer'
require 'yukata/coercions/string'
require 'yukata/coercions/time'
require 'yukata/coercions/hash'
require 'yukata/coercions/boolean'
