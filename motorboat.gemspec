# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'motorboat/version'

Gem::Specification.new do |s|
  s.name        = 'motorboat'
  s.version     = Motorboat::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Tom Johnell']
  s.email       = ['tjohnell@gmail.com']
  s.homepage    = ""
  s.summary     = "Find a boat!"
  s.description = "They don't have the time I want, so let's see what we can do."

  s.rubyforge_project = 'new-gem'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
