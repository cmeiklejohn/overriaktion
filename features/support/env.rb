require 'aruba/cucumber'
require 'methadone/cucumber'
require 'webmock/cucumber'

require 'overriaktion'
include Overriaktion

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

Before do
  # Using "announce" causes massive warnings on 1.9.2
  @puts = true
end
