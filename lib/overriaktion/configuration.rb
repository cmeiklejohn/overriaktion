module Overriaktion
  class Configuration
    include Singleton

    VALID_ATTRIBUTES = [:api_key, :api_host]

    attr_accessor *VALID_ATTRIBUTES

    def api_host 
      @api_host || EndPoints::DEFAULT
    end

    def self.method_missing(method, *args, &block)
      return super unless instance.respond_to?(method)
      instance.send(method, *args, &block)
    end
  end
end
