require 'rubygems'
require 'rubygems/specification'
require 'rake'
require 'rake/gempackagetask'
require 'spec/rake/spectask'
 
GEM = "updateafraid"
GEM_VERSION = "0.1.1"
SUMMARY = "A Dynamic DNS client for domains parked at afraid.org"
AUTHOR = "Logan Koester"
EMAIL = "logan@logankoester.com"
HOMEPAGE = "http://logankoester.com"

 
spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = SUMMARY
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  s.require_paths = ['lib']
  s.bindir = 'bin'
  s.files = ['bin/updateafraid', 'lib/updateafraid.rb']
  s.executables << 'updateafraid'
  s.default_executable = 'bin/updateafraid'
  s.add_dependency('happymapper', '>= 0.1.2')
	s.add_dependency('optiflag', '>= 0.6.5')
  s.rubyforge_project = GEM # GitHub bug, gem isn't being build when this miss
end

Spec::Rake::SpecTask.new do |t|
  t.spec_files = ['spec/updateafraid_spec.rb']
  t.spec_opts = %w(-fs --color)
end
  
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
 
desc "Install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end
 
desc "Create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
