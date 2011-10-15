require 'spec_helper'
require 'overriaktion/mocked_responses'

describe Overriaktion do 
  describe Overriaktion::Client do 
    subject { Overriaktion::Client.new }

    it "retrieves a list of riak clusters" do 
      stub_request(:get, "http://dont.overriak.com/riak_clusters.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_CLUSTERS, :headers => {})
      clusters = subject.clusters
      clusters.length.should == 1
      clusters.each { |cluster| cluster.should be_a_kind_of(Overriaktion::Cluster) }
    end
  end
end
