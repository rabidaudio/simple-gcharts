# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple/gcharts/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-gcharts"
  spec.version       = Simple::Gcharts::VERSION
  spec.authors       = ["Charles Julian Knight"]
  spec.email         = ["charles@rabidaudio.com"]

  spec.summary       = %q{A simple library for creating Google Charts in Rails.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = Dir["{app,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2.6"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
