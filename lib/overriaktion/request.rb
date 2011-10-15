module Overriaktion
  module Request
    include HTTParty

    base_uri 'dont.overriak.com'

    format :json
  end
end
