module Overriaktion
  class Request
    include HTTParty

    format :json

    def api_host
      Configuration.api_host
    end

    def full_uri_for(uri)
      "http://#{api_host}#{uri}"
    end

    def get(uri) 
      self.class.get(full_uri_for(uri))
    end
  end
end
