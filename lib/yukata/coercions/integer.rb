Yukata.coercer.register(Integer, Time)     { |obj, _| Time.at(obj) }
Yukata.coercer.register(Integer, Date)     { |obj, _| Time.at(obj).to_date }
Yukata.coercer.register(Integer, DateTime) { |obj, _| Time.at(obj).to_datetime }
Yukata.coercer.register(Integer, String)   { |obj, _| obj.to_s }
