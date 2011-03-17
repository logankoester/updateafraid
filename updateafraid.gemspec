Gem::Specification.new do |s|
  s.name = %q{updateafraid}
  s.version = "0.1.2"
  s.date = %q{2008-12-17}
  s.summary = %q{A Dynamic DNS client for domains parked at afraid.org}
  s.email = %q{logan@logankoester.com}
  s.homepage = %q{http://logankoester.com}
  s.rubyforge_project = %q{updateafraid}
  s.default_executable = %q{bin/updateafraid}
  s.authors = ["Logan Koester"]
  s.files = ["bin/updateafraid", "lib/updateafraid.rb"]
  s.executables = ["updateafraid"]
  s.add_dependency(%q<happymapper>, [">= 0.1.2"])
  s.add_dependency(%q<optiflag>, [">= 0.6.5"])
end
