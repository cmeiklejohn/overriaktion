require 'spec_helper'

module Overriaktion 
  describe self do 
    it 'returns the client when instantiated' do 
      subject.new.should be_a_kind_of(Client)
    end

    it 'returns the same client when instantiated twice' do 
      subject.new.should == subject.new
    end

    it 'should be able to be configured' do 
      subject.configure do |config|
        config.api_key = '1'
        config.api_host = 'api.overriak.com'
      end

      subject.configuration.api_key.should == '1'
      subject.configuration.api_host.should == 'api.overriak.com'
    end
  end
end
