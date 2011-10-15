module Overriaktion
  class RiakCluster < Model
    def riak_node(riak_node_id)
      @client.riak_node(self.id, riak_node_id)
    end

    def riak_nodes
      @client.riak_nodes(self.id)
    end
  end
end
