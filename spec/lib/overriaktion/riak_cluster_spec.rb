require 'spec_helper'

module Overriaktion
  describe RiakCluster do 
    subject { riak_cluster } 

    context 'with riak nodes' do 
      let(:riak_cluster) { RiakCluster.new(:id => 1) }

      it "returns it's riak nodes" do 
        Client.instance.should_receive(:riak_nodes)
        riak_nodes = subject.riak_nodes
      end
      
      it "returns one riak node in it's cluster" do
        Client.instance.should_receive(:riak_node)
        riak_node = subject.riak_node(1)
      end
    end

    context 'with a name' do 
      let(:riak_cluster) { RiakCluster.new(:name => 'Name') } 

      it "returns it's name" do
        subject.to_s.should == "Name"
      end
    end
  end
end
