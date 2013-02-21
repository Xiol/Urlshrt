# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'urlshrt/version'

Gem::Specification.new do |gem|
  gem.name          = "urlshrt"
  gem.version       = Urlshrt::VERSION
  gem.authors       = ["Dane Elwell"]
  gem.email         = ["dane.elwell@gmail.com"]
  gem.description   = %q{Provides a URL shortner that does things with redis and Postgres with massive ineffeciency}
  gem.summary       = %q{URL shortening}
  gem.homepage      = ""
  
  gem.add_dependency 'redis'
  gem.add_dependency 'datamapper'
  gem.add_dependency 'dm-postgres-adapter'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
