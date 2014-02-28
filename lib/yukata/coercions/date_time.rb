Yukata.coercer.register(DateTime, Time)     { |obj, _| obj.to_time }
Yukata.coercer.register(DateTime, Date)     { |obj, _| obj.to_date }
Yukata.coercer.register(DateTime, Integer)  { |obj, _| obj.to_time.to_i }
Yukata.coercer.register(DateTime, Float)    { |obj, _| obj.to_time.to_f }
Yukata.coercer.register(DateTime, String)   { |obj, _| obj.to_s }
