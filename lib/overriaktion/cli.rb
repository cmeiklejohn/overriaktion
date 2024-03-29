module Overriaktion
  class CLI
    attr_accessor :client

    def initialize(api_key)
      @client = Overriaktion.new(:api_key => api_key)
    end

    # Dispatcher
    #

    def dispatch(operation, cluster_name, node_uri)
      case operation
      when 'list'
        list(cluster_name)
      when 'sample'
        sample(cluster_name, node_uri)
      else 
        puts "'#{operation}' is not a valid operation"
      end
    end

    def self.dispatch(api_key, operation, cluster_name, node_uri)
      if client = self.new(api_key)
        client.dispatch(operation, cluster_name, node_uri)
      end
    end

    # Dispatch mechanisms
    #

    def list(cluster_name)
      @client.riak_clusters.each do |cluster|
        puts "#{cluster}"
        
        cluster.riak_nodes.each do |node|
          puts "  - #{node}"
        end
      end
    end

    def sample(cluster_name, node_uri)
      if riak_node = @client.riak_node_by_cluster_name_and_node_uri(cluster_name, node_uri)
        retval = riak_node.sample
      end

      puts "OK"
    end
  end
end
