Yukata.coercer.register(Hash, String) { |obj, _| obj.to_s }
Yukata.coercer.register(Hash, Array) { |obj, _| obj.to_a }