module Overriaktion
  class Sample < Model
    def perform
      @response = Net::HTTP.get("#{ip_address}", "/stats", port)
      !@response.nil?
    end

    def save
      @client.create_sample(id, @response)
    end
  end
end
