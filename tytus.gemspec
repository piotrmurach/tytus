# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tytus/version"

Gem::Specification.new do |s|
  s.name        = "tytus"
  s.version     = Tytus::VERSION
  s.authors     = ["Piotr Murach"]
  s.email       = [""]
  s.homepage    = "https://github.com/peter-murach/tytus"
  s.summary     = %q{Helps you manage page titles in your Rails application.}
  s.description = %q{In order to improve overall design of your app and increase findability of your pages in search ranks, Tytus gives you a declarative manner in which to title your pages.}

  s.rubyforge_project = "tytus"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "capybara"
end
