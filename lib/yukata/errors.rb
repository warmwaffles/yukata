module Yukata
  class Error < StandardError
  end

  class ConfigError < Error
  end

  class ResourceNotFoundError <Error
  end
end