# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "sdk"
  spec.version       = Sdk::VERSION
  spec.authors       = ["yangcs2009"]
  spec.email         = ["yangchangsheng@meituan.com"]
  spec.summary       = %q{Ruby SDK for MOS.}
  spec.description   = %q{rite a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ["lib/sdk/base.rb","lib/sdk.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
