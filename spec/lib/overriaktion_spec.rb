require 'spec_helper'

describe Overriaktion do 
  describe Overriaktion::RiakCluster do 
    subject { Overriaktion::RiakCluster.new(JSON.parse(Overriaktion::MockedResponses::RIAK_CLUSTER)) }
    specify { subject.id.should == 1 }
    specify { subject.name.should == "Localhost" }

    it "returns it's riak nodes" do 
      stub_request(:get, "http://dont.overriak.com/riak_clusters/1/riak_nodes.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_NODES, :headers => {})
      riak_nodes = subject.riak_nodes
      riak_nodes.length.should == 1
      riak_nodes.each { |riak_node| riak_node.should be_a_kind_of(Overriaktion::RiakNode) }
    end
  end
  
  describe Overriaktion::RiakNode do 
    subject { Overriaktion::RiakNode.new(JSON.parse(Overriaktion::MockedResponses::RIAK_NODE)) }
    specify { subject.id.should == 1 }
    specify { subject.ip_address.should == "127.0.0.1" } 
    specify { subject.port.should == "8098" }
    specify { subject.username.should == "root" }

    it "returns it's riak cluster" do 
      stub_request(:get, "http://dont.overriak.com/riak_clusters/1.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_CLUSTER, :headers => {})
      riak_cluster = subject.riak_cluster
      riak_cluster.should be_a_kind_of(Overriaktion::RiakCluster)
    end
  end

  describe Overriaktion::Client do 
    subject { Overriaktion::Client.instance }

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
      stub_request(:get, "http://dont.overriak.com/riak_clusters/1/riak_nodes.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_NODES, :headers => {})
      riak_nodes = subject.riak_nodes(1)
      riak_nodes.length.should == 1
      riak_nodes.each { |riak_node| riak_node.should be_a_kind_of(Overriaktion::RiakNode) }
    end

    it "retrieves information about a clusters single riak node" do
      stub_request(:get, "http://dont.overriak.com/riak_clusters/1/riak_nodes/1.json").
        to_return(:status => 200, :body => Overriaktion::MockedResponses::RIAK_NODE, :headers => {})
      riak_node = subject.riak_node(1, 1)
      riak_node.should be_a_kind_of(Overriaktion::RiakNode)
    end
  end
end
