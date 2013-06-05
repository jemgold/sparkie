# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gaffer/version'

Gem::Specification.new do |spec|
  spec.name          = "gaffer"
  spec.version       = Gaffer::VERSION
  spec.authors       = ["Jon Gold"]
  spec.email         = ["hello@designedbygold.com"]
  spec.description   = %q{Tools for working with electronics}
  spec.summary       = %q{Tools for working with electronics with Ruby}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
