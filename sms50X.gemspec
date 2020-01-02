# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sms50X/version'

Gem::Specification.new do |spec|
  spec.name          = "sms50X-ruby"
  spec.version       = Sms50X::VERSION
  spec.authors       = ["Pablo Cordero"]
  spec.email         = ["pablo.cordero@ejedigitalcr.com"]

  spec.summary       = %q{Ruby wrapper for the SMS50X.com [http://www.sms506.com] API.}
  spec.description   = %q{Send SMSs.}
  spec.homepage      = "https://github.com/ejedigitalcr/sms50X-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "coveralls"
  spec.add_dependency "faraday", '1.0.0'
end
