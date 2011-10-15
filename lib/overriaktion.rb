require "overriaktion/version"

module Overriaktion
  autoload :Client,           "overriaktion/client"
  autoload :Request,          "overriaktion/request"
  autoload :Responses,        "overriaktion/responses"

  autoload :Configuration,    "overriaktion/configuration"

  autoload :Model,            "overriaktion/model"
  autoload :RiakCluster,      "overriaktion/riak_cluster"
  autoload :RiakNode,         "overriaktion/riak_node"

  autoload :EndPoints,        "overriaktion/end_points"

  API_HOST = EndPoints::DEFAULT

  class << self
    def new(options = {})
      Client.instance
    end

    def configure
      yield configuration
    end

    def configuration 
      Configuration.instance
    end
  end
end
