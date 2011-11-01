# encoding: UTF-8

$:.push File.expand_path("../lib", __FILE__)

require "overriaktion/version"

Gem::Specification.new do |gem|
  gem.name        = "overriaktion"
  gem.version     = Overriaktion::VERSION
  gem.authors     = ["Christopher Meiklejohn"]
  gem.email       = ["christopher.meiklejohn@gmail.com"]
  gem.homepage    = "https://github.com/cmeiklejohn/overriaktion"
  gem.summary     = %q{Client gem for the Overriak service.}
  gem.description = %q{Client gem for the Overriak service.}

  gem.rubyforge_project = "overriaktion"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency('httparty')
  gem.add_dependency('methadone')
  gem.add_dependency('vcr')
  gem.add_dependency('webmock')

  gem.add_development_dependency('relish')
  gem.add_development_dependency('capybara-mechanize')
  
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake','~> 0.9.2')
  gem.add_development_dependency('rspec') 

  gem.add_development_dependency('guard')
  gem.add_development_dependency('guard-rspec')
  gem.add_development_dependency('guard-cucumber')
end
