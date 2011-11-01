# encoding: UTF-8

require 'vcr'

if ENV['RAILS_ENV'] == 'test'
  VCR.config do |c|
    c.stub_with :webmock
    c.cassette_library_dir = "#{File.expand_path('../../..', __FILE__)}/fixtures/vcr_cassettes"
    c.default_cassette_options = { :record => :new_episodes }
  end
end
