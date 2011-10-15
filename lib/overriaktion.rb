require "overriaktion/version"

module Overriaktion
  autoload :Client,           "overriaktion/client"
  autoload :Request,          "overriaktion/request"
  autoload :MockedResponses,  "overriaktion/mocked_responses"

  autoload :Cluster,          "overriaktion/cluster"
end
