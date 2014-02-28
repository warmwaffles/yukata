# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yukata/version'

Gem::Specification.new do |spec|
  spec.name          = 'yukata'
  spec.version       = Yukata::VERSION
  spec.authors       = ['Matthew Johnston']
  spec.email         = ['warmwaffles@gmail.com']
  spec.description   = %q{Attributes for ruby objects}
  spec.summary       = %q{Attributes for ruby objects}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency('bundler', '~> 1.3')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rake')
end
