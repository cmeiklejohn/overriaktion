module Overriaktion
  class Request
    include HTTParty

    base_uri API_HOST

    format :json

    def get(uri) 
      self.class.get(uri)
    end
  end
end
