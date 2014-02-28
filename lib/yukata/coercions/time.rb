Yukata.coercer.register(Time, Date)     { |obj, _| obj.to_date }
Yukata.coercer.register(Time, DateTime) { |obj, _| obj.to_datetime }
Yukata.coercer.register(Time, Integer)  { |obj, _| obj.to_i }
Yukata.coercer.register(Time, Float)    { |obj, _| obj.to_f }
Yukata.coercer.register(Time, String)   { |obj, _| obj.to_s }
