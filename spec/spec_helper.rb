require 'simplecov'
SimpleCov.start

require 'yukata'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
