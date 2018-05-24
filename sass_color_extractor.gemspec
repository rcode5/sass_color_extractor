# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sass_color_extractor/version'

Gem::Specification.new do |spec|
  spec.name          = "sass-color-extractor"
  spec.version       = SassColorExtractor::VERSION
  spec.authors       = ["Mr Rogers"]
  spec.email         = ["jon@rcode5.com"]
  spec.summary       = %q{Extract colors from Sass/Scss in ruby - can be used to generate a nice palette for a Rails app.}
  #spec.description  = ""
  spec.homepage      = "https://github.com/rcode5/sass_color_extractor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sass", "~> 3.4"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "byebug", "~> 3.5"
  spec.add_development_dependency "bundle-audit", "~> 0.1.0"
end
