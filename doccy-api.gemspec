# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doccy/version'

Gem::Specification.new do |spec|
  spec.name          = "doccy-api"
  spec.version       = Doccy::VERSION
  spec.authors       = ["Sentia Australia Pty Ltd"]
  spec.email         = ["support@doccyapp.com"]
  spec.summary       = "Ruby wrapper around Doccy API"
  spec.description   = "Ruby wrapper around Doccy API for creating, sending and sharing documents. This api can be used if you're a Doccy partner or just want to use Doccy in your app."
  spec.homepage      = "https://www.doccyapp.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
  
  spec.add_dependency "httparty"
  spec.add_dependency "json"
  spec.add_dependency "faraday"
  
end
