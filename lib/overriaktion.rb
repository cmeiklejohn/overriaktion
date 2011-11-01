require 'overriaktion/version'
require 'overriaktion/vcr'

require 'singleton'
require 'httparty'
require 'json'

module Overriaktion
  autoload :Client,           "overriaktion/client"
  autoload :Request,          "overriaktion/request"

  autoload :Configuration,    "overriaktion/configuration"

  autoload :Model,            "overriaktion/model"
  autoload :RiakCluster,      "overriaktion/riak_cluster"
  autoload :RiakNode,         "overriaktion/riak_node"

  autoload :EndPoints,        "overriaktion/end_points"

  autoload :CLI,              "overriaktion/cli"

  autoload :Sample,           "overriaktion/sample"

  class << self
    def new(options = {})
      Client.instance.tap do |instance|
        instance.configure do |config|
          options.each_pair do |key, value| 
            config.send("#{key}=".to_sym, value)
          end
        end
      end
    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
