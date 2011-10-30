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
      end
    end

    def self.dispatch(operation, cluster_name, node_uri)
      self.new.dispatch(*args)
    end

    # Dispatch mechanisms
    #

    def list(cluster_name)
      @client.riak_clusters.each do |cluster|
        puts "#{cluster}"
      end
    end
  end
end
