module Overriaktion
  class Configuration
    include Singleton

    VALID_ATTRIBUTES = [:api_key, :api_host]

    attr_accessor *VALID_ATTRIBUTES
  end
end
