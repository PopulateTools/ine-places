# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ine/places/version'

Gem::Specification.new do |spec|
  spec.name          = "ine-places"
  spec.version       = INE::Places::Version
  spec.authors       = ["Fernando Blat"]
  spec.email         = ["fernando@blat.es"]

  spec.summary       = %q{An easy way to work with Spanish regions in Ruby}
  spec.description   = %q{Work with Spanish regions using INE codes and data}
  spec.homepage      = "https://github.com/PopulateTools/ine-places"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "zeitwerk", ">= 2.1.2"
  spec.add_runtime_dependency "activesupport", ">= 4.2"
  spec.add_runtime_dependency "csv", ">= 3.3"

  spec.add_development_dependency "bundler", "~> 2.6"
  spec.add_development_dependency "rake", "~> 13.3"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "byebug", '~> 11.1'
end
