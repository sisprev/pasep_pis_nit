lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sisprev/pasep_pis_nit/version'

Gem::Specification.new do |spec|
  spec.name          = "sisprev-pasep_pis_nit"
  spec.version       = Sisprev::PasepPisNit::VERSION
  spec.authors       = ["Eduardo de O. Hernandes"]
  spec.email         = ["eduardodeoh@gmail.com"]
  spec.summary       = %q{PASEP}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "pry"
end
