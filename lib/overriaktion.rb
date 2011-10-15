require "overriaktion/version"

module Overriaktion
  autoload :Client,           "overriaktion/client"
  autoload :Request,          "overriaktion/request"
  autoload :MockedResponses,  "overriaktion/mocked_responses"

  autoload :Model,            "overriaktion/model"
  autoload :RiakCluster,      "overriaktion/riak_cluster"
end
