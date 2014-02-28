Yukata.coercer.register(Fixnum, String)   { |obj, _| obj.to_s }
Yukata.coercer.register(Fixnum, Time)     { |obj, _| Time.at(obj) }
Yukata.coercer.register(Fixnum, Date)     { |obj, _| Time.at(obj).to_date }
Yukata.coercer.register(Fixnum, DateTime) { |obj, _| Time.at(obj).to_datetime }
Yukata.coercer.register(Fixnum, String)   { |obj, _| obj.to_s }
Yukata.coercer.register(Fixnum, Integer)  { |obj, _| obj.to_i }
Yukata.coercer.register(Fixnum, Float)    { |obj, _| obj.to_f }
