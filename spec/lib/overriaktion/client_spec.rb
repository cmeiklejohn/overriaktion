require 'spec_helper'

module Overriaktion
  describe Client do 
    subject { Client.instance }

    it "retrieves a list of riak clusters" do 
      stub_request(:get, "http://#{Configuration.api_host}/riak_clusters.json").
        to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTERS, :headers => {})
      riak_clusters = subject.riak_clusters
      riak_clusters.length.should == 1
      riak_clusters.each { |riak_cluster| riak_cluster.should be_a_kind_of(RiakCluster) }
    end

    it "retrieves information about one riak cluster" do 
      stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/1.json").
        to_return(:status => 200, :body => Responses::JSON::RIAK_CLUSTER, :headers => {})
      riak_cluster = subject.riak_cluster(1)
      riak_cluster.should be_a_kind_of(RiakCluster)
    end

    it "retrieves information about a clusters riak nodes" do 
      stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/1/riak_nodes.json").
        to_return(:status => 200, :body => Responses::JSON::RIAK_NODES, :headers => {})
      riak_nodes = subject.riak_nodes(1)
      riak_nodes.length.should == 1
      riak_nodes.each { |riak_node| riak_node.should be_a_kind_of(RiakNode) }
    end

    it "retrieves information about a clusters single riak node" do
      stub_request(:get, "http://#{Configuration.api_host}/riak_clusters/1/riak_nodes/1.json").
        to_return(:status => 200, :body => Responses::JSON::RIAK_NODE, :headers => {})
      riak_node = subject.riak_node(1, 1)
      riak_node.should be_a_kind_of(RiakNode)
    end
  end
end
