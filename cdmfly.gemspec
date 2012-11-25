# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cdmfly/version'

Gem::Specification.new do |gem|
  gem.name          = "cdmfly"
  gem.version       = Cdmfly::VERSION
  gem.authors       = ["Philip Hale"]
  gem.email         = ["p.hale.09@aberdeen.ac.uk"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  #gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.executables = ["cdmfly"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "rb-fsevent", '~> 0.9.1'
  gem.add_development_dependency "turnip"
  gem.add_development_dependency "cocaine"
  gem.add_development_dependency "rb-inotify"
  gem.add_development_dependency "childprocess"

end
