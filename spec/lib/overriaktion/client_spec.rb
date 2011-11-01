require 'spec_helper'

module Overriaktion
  describe Client do 
    subject { Client.instance }

    it "retrieves a list of riak clusters" do 
      VCR.use_cassette('overriak') do
        riak_clusters = subject.riak_clusters
        riak_clusters.length.should == 1
        riak_clusters.each { |riak_cluster| riak_cluster.should be_a_kind_of(RiakCluster) }
      end
    end

    it "retrieves information about one riak cluster" do 
      VCR.use_cassette('overriak') do 
        riak_cluster = subject.riak_cluster(1)
        riak_cluster.should be_a_kind_of(RiakCluster)
      end
    end

    it "retrieves information about a clusters riak nodes" do 
      VCR.use_cassette('overriak') do 
        riak_nodes = subject.riak_nodes(1)
        riak_nodes.length.should == 1
        riak_nodes.each { |riak_node| riak_node.should be_a_kind_of(RiakNode) }
      end
    end

    it "retrieves information about a clusters single riak node" do
      VCR.use_cassette('overriak') do 
        riak_node = subject.riak_node(1, 1)
        riak_node.should be_a_kind_of(RiakNode)
      end
    end

    it "stores a riak node sample" do 
      VCR.use_cassette('overriak') do 
        subject.create_sample(1, "response")
      end
    end
  end
end
