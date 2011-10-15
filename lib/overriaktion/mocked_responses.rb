module Overriaktion
  module MockedResponses
    RIAK_CLUSTER = '{"created_at":"2011-10-10T03:31:34Z","id":1,"name":"Localhost","updated_at":"2011-10-10T03:31:34Z","user_id":1}'
    RIAK_CLUSTERS = "[#{RIAK_CLUSTER}]"

    RIAK_NODE = '{"created_at":"2011-10-10T03:31:41Z","id":1,"ip_address":"127.0.0.1","port":"8098","riak_cluster_id":1,"updated_at":"2011-10-10T21:14:14Z","username":"root"}'
    RIAK_NODES = "[#{RIAK_NODE}]"
  end
end
