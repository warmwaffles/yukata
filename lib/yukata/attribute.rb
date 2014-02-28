module Yukata
  # A single attribute that is attached to a model
  #
  # @author Matthew A. Johnston
  class Attribute
    attr_reader :type

    # @param type [Class] the class this attribute represents
    # @param options [Hash] extra options that can be prescribed
    def initialize(type=String, options={})
      @type    = type
      if options[:default].is_a?(Proc)
        @default = options[:default]
      else
        @default = -> { options[:default] }
      end
    end

    def default
      @default.call
    end

    def coerce(obj)
      return obj if obj.is_a?(type)
      Yukata.coercer.coerce(obj, type)
    end
  end
end
