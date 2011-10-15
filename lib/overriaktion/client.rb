module Overriaktion
  class Client
    def riak_clusters
      response = Request.get("/riak_clusters.json")
      response.map { |riak_cluster| RiakCluster.new(riak_cluster) }
    end

    def riak_cluster(riak_cluster_id)
      response = Request.get("/riak_clusters/#{riak_cluster_id}.json")
      RiakCluster.new(response)
    end
  end
end
