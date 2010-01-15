# encoding: UTF-8

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'
require 'rake/gempackagetask'

require File.join(File.dirname(__FILE__), 'lib', 'brdinheiro_lite', 'version')

PKG_BUILD     = ENV['PKG_BUILD'] ? '.' + ENV['PKG_BUILD'] : ''
PKG_NAME      = 'brdinheiro-lite'
PKG_VERSION   = BrDinheiro::VERSION::STRING + PKG_BUILD
PKG_FILE_NAME = "#{PKG_NAME}-#{PKG_VERSION}"

RELEASE_NAME  = "REL #{PKG_VERSION}"

desc "Default Task"
task :default => [ :test ]

# Run the unit tests
Rake::TestTask.new { |t|
  t.libs << "test"
  t.pattern = 'test/*_test.rb'
  t.verbose = true
  t.warning = false
}

#Generate the RDoc documentation
Rake::RDocTask.new { |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = "brdinheiro-lite"
  rdoc.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.template = "#{ENV['template']}.rb" if ENV['template']
  rdoc.rdoc_files.include('README', 'CHANGELOG')
  rdoc.rdoc_files.include('lib/**/*')
}

# Create compressed packages
spec = Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = PKG_NAME
  s.summary = "brdinheiro-lite é uma versão simplificada da gem brdinheiro do Brazilian Rails"
  s.description = %q{brdinheiro-lite é uma versão simplificada da gem brdinheiro do Brazilian Rails}
  s.version = PKG_VERSION

  s.authors = ["Marcos Tapajós", "Celestino Gomes", "Andre Kupkosvki", "Vinícius Teles", "Rafael Souza"]
  s.email = "me@rafaelss.com"
  s.rubyforge_project = "brdinheiro-lite"
  s.homepage = "http://rafaelss.com/brdinheiro-lite"

  s.has_rdoc = true
  s.require_path = 'lib'

  s.files = [ "Rakefile", "README", "CHANGELOG", "MIT-LICENSE" ]
  s.files = s.files + Dir.glob( "lib/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
  s.files = s.files + Dir.glob( "test/**/*" ).delete_if { |item| item.include?( "\.svn" ) }
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
  p.need_tar = true
  p.need_zip = true
end