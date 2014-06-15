# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require './lib/sinatra/swig'

Gem::Specification.new do |spec|
  spec.name          = "sinatra-swig"
  spec.version       = '0.0.1'
  spec.authors       = ["Logan Bell"]
  spec.email         = ["lbell@shutterstock.com"]
  spec.description   = %q{swig/sinatra}
  spec.summary       = %q{more to come}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "curly-lib"
  spec.add_dependency "webservice-swigclient"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
