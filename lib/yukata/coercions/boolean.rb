unless defined?(Boolean)
  class Boolean
  end
end

Yukata.coercer.register(String, Boolean) do |string, _|
  %w(1 on t true y yes).include?(string.downcase)
end
