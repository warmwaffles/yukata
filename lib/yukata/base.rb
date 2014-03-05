module Yukata
  class Base
    # @param params [Hash] the parameters you wish to initialize the model
    #    with. If the model does not have an accessor set, it will ignore
    #    the attribute passed.
    def initialize(params={})
      self.attributes = params
    end

    # Sets the attributes on the model
    # @param hash [Hash]
    def attributes=(hash)
      hash.each do |k, v|
        setter = "#{k}="
        self.send(setter, v) if self.respond_to?(setter)
      end
    end

    # Get the attributes on the model. If the attribute was not
    #
    # @return [Hash]
    def attributes
      hash = {}
      self.class.attributes.keys.each do |k|
        hash[k] = send(k) if respond_to?(k)
      end
      hash
    end

    def to_h
      self.attributes
    end

    def self.attributes
      @attributes ||= {}
    end

    # @override
    def self.attr_accessor(*args)
      args.each { |name| self.attributes[name] = Attribute.new(Object) }
      super
    end

    # Declares an attribute on the model
    #
    # @param name [String]
    # @param type [Class] a class that represents the type
    # @param options [Hash] extra options to apply to the attribute
    def self.attribute(name, type=String, options={})
      config = { writer: true, reader: true, coerce: true }.merge(options)

      attr = Attribute.new(type, options)
      self.attributes[name] = attr
      variable = "@#{name}"

      # -------------
      # Define Writer
      # -------------
      if config[:writer]
        define_method("#{name}=") do |object|
          if config[:coerce]
            val = Yukata.coercer.coerce(object, attr.type)
            instance_variable_set(variable, val)
          else
            instance_variable_set(variable, object)
          end
        end
      end

      # -------------
      # Define reader
      # -------------
      if config[:reader]
        define_method(name) do
          val = instance_variable_get(variable)
          unless val
            val = attr.default
            instance_variable_set(variable, val)
          end
          val
        end
      end
    end
  end
end
