module Overriaktion
  class RiakCluster < Model

    def riak_nodes
      client = Client.instance
      client.riak_nodes(self.id)
    end
  end
end
