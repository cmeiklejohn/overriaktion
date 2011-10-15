# encoding: UTF-8

require 'rubygems'
require 'bundler'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rake'
require 'rdoc/task'
require 'rake/clean'
require 'rubygems/package_task'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

include Rake::DSL

Bundler::GemHelper.install_tasks

CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format html -o #{CUKE_RESULTS} --format progress -x"
  t.fork = false
end

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc","lib/**/*.rb","bin/**/*")
end

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task :default => [:spec, :features]
