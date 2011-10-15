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
end
