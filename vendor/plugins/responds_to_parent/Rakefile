require 'bundler/setup'
require 'appraisal'
require 'rake/testtask'
require 'rake/rdoctask'
require 'bundler/gem_tasks'

task :default do
  sh "rake appraisal:install && rake appraisal test"
end

desc 'Test the responds_to_parent plugin.'
Rake::TestTask.new :default do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the responds_to_parent plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RespondsToParent'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('Readme.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
