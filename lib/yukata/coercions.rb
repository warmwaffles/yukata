require 'yukata/coercions/date_definitions'
require 'yukata/coercions/date_time_definitions'
require 'yukata/coercions/fixnum_definitions'
require 'yukata/coercions/float_definitions'
require 'yukata/coercions/integer_definitions'
require 'yukata/coercions/string_definitions'
require 'yukata/coercions/time_definitions'
require 'yukata/coercions/hash_definitions'
require 'yukata/coercions/boolean_definitions'

module Yukata
  module Coercions
    def self.bind_to(coercer)
      Yukata::Coercions::DateDefinitions.bind_to(coercer)
      Yukata::Coercions::DateTimeDefinitions.bind_to(coercer)
      Yukata::Coercions::FixnumDefinitions.bind_to(coercer)
      Yukata::Coercions::FloatDefinitions.bind_to(coercer)
      Yukata::Coercions::IntegerDefinitions.bind_to(coercer)
      Yukata::Coercions::StringDefinitions.bind_to(coercer)
      Yukata::Coercions::TimeDefinitions.bind_to(coercer)
      Yukata::Coercions::HashDefinitions.bind_to(coercer)
      Yukata::Coercions::BooleanDefinitions.bind_to(coercer)
    end
  end
end
