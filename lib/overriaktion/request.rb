module Overriaktion
  class Request
    include HTTParty

    base_uri 'dont.overriak.com'

    format :json

    def get(uri) 
      self.class.get(uri)
    end
  end
end
