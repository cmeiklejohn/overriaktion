module Overriaktion
  class Request
    include HTTParty

    base_uri API_HOST

    format :json

    def initialize(options = {})
      if api_key = options[:api_key]
        self.class.headers        'Authorization' => api_key
        self.class.default_params 'api_key'       => api_key
      end
    end

    def get(uri) 
      self.class.get(uri)
    end
  end
end
