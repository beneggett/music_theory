# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'music_theory/version'

Gem::Specification.new do |spec|
  spec.name          = "music_theory"
  spec.version       = MusicTheory::VERSION
  spec.authors       = ["Ben Eggett"]
  spec.email         = ["beneggett@gmail.com"]
  spec.summary       = %q{Music theory with ruby}
  spec.description   = %q{Create music with pure ruby goodness}
  spec.homepage      = "http://www.beneggett.com/#/ben-eggett"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "wavefile", "~> 0"
  spec.add_runtime_dependency "activesupport"

  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
