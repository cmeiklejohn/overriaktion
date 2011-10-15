require 'spec_helper'

describe Overriaktion do 
  describe Overriaktion::RiakCluster do 
    subject { Overriaktion::RiakCluster.new(JSON.parse(Overriaktion::MockedResponses::RIAK_CLUSTER)) }
    specify { subject.id.should == 1 }
    specify { subject.name.should == "Localhost" }
  end

  describe Overriaktion::Client do 
    subject { Overriaktion::Client.new }

    it "retrieves a list of riak clusters" do 
      stub_request(:get, "http://dont.overriak.com/riak_clusters.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_CLUSTERS, :headers => {})
      riak_clusters = subject.riak_clusters
      riak_clusters.length.should == 1
      riak_clusters.each { |riak_cluster| riak_cluster.should be_a_kind_of(Overriaktion::RiakCluster) }
    end

    it "retrieves information about one riak cluster" do 
      stub_request(:get, "http://dont.overriak.com/riak_clusters/1.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_CLUSTER, :headers => {})
      riak_cluster = subject.riak_cluster(1)
      riak_cluster.should be_a_kind_of(Overriaktion::RiakCluster)
    end

    it "retrieves information about a clusters riak nodes" do 
      pending
    end

    it "retrieves information about a clusters single riak node" do
      pending
    end
  end
end
