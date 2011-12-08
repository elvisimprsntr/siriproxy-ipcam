# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "siriproxy-pugme"
  s.version     = "1.0"
  s.authors     = ["Jon Maddox"]
  s.email       = ["jon@jonmaddox.com"]
  s.homepage    = "http://jonmaddox.com.com"
  s.summary     = %q{Make Siri fetch you a pug}
  s.description = %q{This is a very simple plugin for getting random pug pictures from Siri}

  s.rubyforge_project = "siriproxy-pugme"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "httparty"

  s.add_development_dependency "rake"

end
