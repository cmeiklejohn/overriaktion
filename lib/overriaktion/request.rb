module Overriaktion
  class Request
    extend Forwardable

    def_delegators :configuration, :api_key, :api_host

    def configuration
      Configuration.instance
    end

    include HTTParty

    def initialize
      if api_key
        self.class.headers 'Authorization' => api_key
      end
      self.class.format :json
      self.class.base_uri api_host
    end

    def get(uri) 
      self.class.get(uri)
    end

    def post(uri, query) 
      self.class.post(uri, :query => query)
    end
  end
end
