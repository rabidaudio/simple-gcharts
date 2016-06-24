# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple-gcharts/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-gcharts"
  spec.version       = SimpleGCharts::VERSION
  spec.authors       = ["Charles Julian Knight"]
  spec.email         = ["charles@rabidaudio.com"]

  spec.summary       = %q{A simple library for creating Google Charts in Rails.}
  spec.description   = %q{A helper and some javascript to make it easy to generate Google Charts.}
  spec.homepage      = "https://github.com/rabidaudio/simple-gcharts"
  spec.license       = "MIT"

  spec.files         = Dir["{app,lib}/**/*", "LICENSE.txt", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 4.0"
  spec.add_dependency "jquery-rails", ">= 1.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
