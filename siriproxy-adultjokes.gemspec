# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-adultjokes"
  s.version     = "1.0"
  s.authors     = ["elvisimprsntr"]
  s.email       = [""]
  s.homepage    = "https://github.com/elvisimprsntr/SiriProxy-AdultJokes"
  s.summary     = %q{SiriProxy plugin to push custom images to Siri for lots of laughs!}
  s.description = %q{SiriProxy plugin to push custom images to Siri for lots of laughs!}

  s.rubyforge_project = "siriproxy-adultjokes"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "httparty"

  s.add_development_dependency "rake"

end
