require "overriaktion/version"

module Overriaktion
  autoload :Client,           "overriaktion/client"
  autoload :Request,          "overriaktion/request"
  autoload :Responses,        "overriaktion/responses"

  autoload :Model,            "overriaktion/model"
  autoload :RiakCluster,      "overriaktion/riak_cluster"
  autoload :RiakNode,         "overriaktion/riak_node"

  autoload :EndPoints,        "overriaktion/end_points"

  API_HOST = EndPoints::DEFAULT

  class << self
    def new(options = {})
      Client.instance
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
