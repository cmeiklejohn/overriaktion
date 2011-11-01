require 'spec_helper'

module Overriaktion
  describe RiakNode do 
    subject { riak_node } 

    context 'in a riak cluster' do 
      let(:riak_node) { RiakNode.new(:riak_cluster_id => 1) }

      it "returns it's riak cluster" do
        Client.instance.should_receive(:riak_cluster)
        riak_cluster = subject.riak_cluster
      end
    end

    context 'with a full uri' do
      let(:riak_node) do 
        RiakNode.new(:username   => 'root', 
                     :ip_address => '127.0.0.1', 
                     :port       => '8098')
      end

      it "returns it's uri" do
        subject.to_s.should == "root@127.0.0.1:8098"
      end
    end

    context 'with a full uri and id' do
      let(:riak_node) do 
        RiakNode.new(:username   => 'root', 
                     :ip_address => '127.0.0.1', 
                     :port       => '8098',
                     :id         => 1)
      end

      it 'can be sampled' do
        Sample.should_receive(:perform)
        subject.sample
      end
    end
  end
end
