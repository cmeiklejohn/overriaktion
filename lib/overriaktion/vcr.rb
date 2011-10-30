# encoding: UTF-8

require 'vcr'

VCR.config do |c|
  c.stub_with :webmock
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.default_cassette_options = { :record => :none }
end
