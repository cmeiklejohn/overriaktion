require 'spec_helper'

module Overriaktion 
  describe self do 
    it 'returns the client when instantiated' do 
      subject.new.should be_a_kind_of(Client)
    end

    it 'returns the same client when instantiated twice' do 
      subject.new.should == subject.new
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
        stub_request(:get, "http://api.overriak.com/riak_clusters.json").
          to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTERS, :headers => {'Authorization' => 1})
        riak_clusters = subject.riak_clusters
        a_request(:get, "http://api.overriak.com/riak_clusters.json").
          with(:body => "", :headers => {'Authorization' => '1'}).
          should have_been_made.once
      end
    end
  end
end
