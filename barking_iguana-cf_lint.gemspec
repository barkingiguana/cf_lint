# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'barking_iguana/cf_lint/version'

Gem::Specification.new do |spec|
  spec.name          = 'barking_iguana-cf_lint'
  spec.version       = BarkingIguana::CfLint::VERSION
  spec.authors       = ['Craig R Webster']
  spec.email         = ['craig@barkingiguana.com']
  spec.license       = 'MIT'

  spec.summary       = 'Linting framework for CloudFoundation'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/barkingiguana.com/cf_lint'


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'simplecov'

  spec.required_ruby_version = '~> 2.2'

  spec.add_runtime_dependency 'barking_iguana-logging'
  spec.add_runtime_dependency 'barking_iguana-benchmark'
  spec.add_runtime_dependency 'colorize'
  spec.add_runtime_dependency 'cfn-model'
end
