require 'spec_helper'

module Overriaktion
  describe RiakCluster do 
    subject { RiakCluster.new(JSON.parse(Responses::JSON::RIAK_CLUSTER)) }

    specify { subject.id.should == 1 }
    specify { subject.name.should == "Localhost" }

    it "returns it's riak nodes" do 
      VCR.use_cassette('riak nodes') do 
        riak_nodes = subject.riak_nodes
        riak_nodes.length.should == 1
        riak_nodes.each { |riak_node| riak_node.should be_a_kind_of(RiakNode) }
      end
    end
    
    it "returns one riak node in it's cluster" do
      VCR.use_cassette('riak node') do 
        riak_node = subject.riak_node(1)
        riak_node.should be_a_kind_of(RiakNode)
      end
    end
  end
end
