module Overriaktion
  class RiakNode < Model
    def riak_cluster
      @client.riak_cluster(self.riak_cluster_id)
    end
  end
end
