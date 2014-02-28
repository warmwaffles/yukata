Yukata.coercer.register(String, Time) do |obj, type|
  begin
    type.parse(obj)
  rescue ArgumentError
    nil
  end
end

Yukata.coercer.register(String, Date) do |obj, type|
  begin
    type.parse(obj)
  rescue ArgumentError
    nil
  end
end

Yukata.coercer.register(String, DateTime) do |obj, type|
  begin
    type.parse(obj)
  rescue ArgumentError
    nil
  end
end

Yukata.coercer.register(String, Integer)  { |obj, _| obj.to_i }
Yukata.coercer.register(String, Float) { |obj, _| obj.to_f }
