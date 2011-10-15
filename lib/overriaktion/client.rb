module Overriaktion
  class Client
    def clusters
      response = Request.get("/riak_clusters.json")
      response.map { |cluster| Cluster.new(cluster) }
    end
  end
end
