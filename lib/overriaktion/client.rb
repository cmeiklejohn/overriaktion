module Overriaktion
  class Client
    attr_accessor :request 

    def initialize 
      @request = Request.new
    end

    def riak_clusters
      response = @request.get("/riak_clusters.json")
      response.map { |riak_cluster| RiakCluster.new(riak_cluster) }
    end

    def riak_cluster(riak_cluster_id)
      response = @request.get("/riak_clusters/#{riak_cluster_id}.json")
      RiakCluster.new(response)
    end

    def riak_nodes(riak_cluster_id)
      response = @request.get("/riak_clusters/#{riak_cluster_id}/riak_nodes.json")
      response.map { |riak_node| RiakNode.new(riak_node) }
    end

    def riak_node(riak_cluster_id, riak_node_id)
      response = @request.get("/riak_clusters/#{riak_cluster_id}/riak_nodes/#{riak_node_id}.json")
      RiakNode.new(response)
    end
  end
end
