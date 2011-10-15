# encoding: UTF-8

ENV["RAILS_ENV"] ||= "test"

PROJECT_ROOT = File.expand_path("../..", __FILE__)
$LOAD_PATH << File.join(PROJECT_ROOT, "lib")

Bundler.require

require 'overriaktion'

require 'httparty'
require 'webmock/rspec'
require 'json'
