module Overriaktion
  class RiakNode < Model
    def riak_cluster
      @client.riak_cluster(self.riak_cluster_id)
    end

    def to_s
      "#{self.username}@#{self.ip_address}:#{self.port}"
    end
  end
end
