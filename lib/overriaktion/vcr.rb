# encoding: UTF-8

require 'vcr'

if ENV['RAILS_ENV'] == 'test'
  PROJECT_ROOT = File.expand_path("../../..", __FILE__)
  
  VCR.config do |c|
    c.stub_with :webmock
    c.cassette_library_dir = "#{PROJECT_ROOT}/fixtures/vcr_cassettes"
    c.default_cassette_options = { :record => :none }
  end
end
