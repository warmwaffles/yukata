Yukata.coercer.register(Date, Time)     { |obj, _| obj.to_time }
Yukata.coercer.register(Date, DateTime) { |obj, _| obj.to_datetime }
Yukata.coercer.register(Date, Integer)  { |obj, _| obj.to_time.to_i }
Yukata.coercer.register(Date, Float)    { |obj, _| obj.to_time.to_f }
Yukata.coercer.register(Date, String)   { |obj, _| obj.to_s }
