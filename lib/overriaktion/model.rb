module Overriaktion
  class Model < Hash
    def initialize(options = {}) 
      options.each_pair do |key, value|
        self[key.to_sym] = value
      end
    end

    def method_missing(method, *params)  
      method = method.to_sym  
      return self[method] if self.keys.collect(&:to_sym).include?(method)  
      super  
    end  
  end
end
