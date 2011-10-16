module Overriaktion
  class CLI
    attr_accessor :client

    def initialize(api_key)
      @client = Overriaktion.new(:api_key => api_key)
    end

    def dispatch(resource, operation)
      case resource
      when 'cluster'
        case operation 
        when 'list'
          puts "performing request"
          @client.riak_clusters.map do |cluster| 
            puts cluster 
          end
        end
      end
    end
  end
end
