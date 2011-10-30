require 'spec_helper'

module Overriaktion 
  describe self do 
    it 'returns the client when instantiated' do 
      subject.new.should be_a_kind_of(Client)
    end

    it 'returns the same client when instantiated twice' do 
      subject.new.should == subject.new
    end

    describe 'once configured via the instantiation call' do 
      subject do 
        Overriaktion.new(:api_key => '2', :api_host => 'api-v2.overriak.com')
      end

      after do 
        subject.configure do |config|
          config.api_key  = nil
          config.api_host = nil
        end
      end

      it 'should retain that configuration' do 
        subject.configuration.api_key.should  == '2'
        subject.configuration.api_host.should == 'api-v2.overriak.com'
      end

      it "should honor that configuration when making an API request" do 
        VCR.use_cassette('api-v2 riak clusters') do 
          riak_clusters = subject.riak_clusters
        end
      end
    end

    describe 'once configured' do 
      before do 
        subject.configure do |config|
          config.api_key  = '1'
          config.api_host = 'api.overriak.com'
        end
      end

      after do 
        subject.configure do |config|
          config.api_key  = nil
          config.api_host = nil
        end
      end

      it 'should retain that configuration' do 
        subject.configuration.api_key.should  == '1'
        subject.configuration.api_host.should == 'api.overriak.com'
      end

      it "should honor that configuration when making an API request" do 
        VCR.use_cassette('api riak clusters') do 
          riak_clusters = subject.riak_clusters
        end
      end
    end
  end
end
