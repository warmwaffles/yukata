Yukata.coercer.register(Float, Time)     { |obj, _| Time.at(obj) }
Yukata.coercer.register(Float, Date)     { |obj, _| Time.at(obj).to_date }
Yukata.coercer.register(Float, DateTime) { |obj, _| Time.at(obj).to_datetime }
Yukata.coercer.register(Float, String)   { |obj, _| obj.to_s }
Yukata.coercer.register(Float, Integer)  { |obj, _| obj.to_i }
