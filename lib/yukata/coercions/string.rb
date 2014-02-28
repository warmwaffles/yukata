Yukata.coercer.register(String, Time)     { |obj, type| type.parse(obj) }
Yukata.coercer.register(String, Date)     { |obj, type| type.parse(obj) }
Yukata.coercer.register(String, DateTime) { |obj, type| type.parse(obj) }
Yukata.coercer.register(String, Integer)  { |obj, _| obj.to_i }
Yukata.coercer.register(String, Float)    { |obj, _| obj.to_f }
