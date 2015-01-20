# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mos-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "mos-sdk"
  spec.version       = MOS::VERSION
  spec.authors       = ["yangcs2009"]
  spec.email         = ["yangchangsheng@meituan.com"]
  spec.summary       = %q{Ruby SDK for MOS.}
  spec.description   = %q{Ruby SDK for MOS.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ["lib/mos-sdk/base.rb","lib/mos-sdk.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end