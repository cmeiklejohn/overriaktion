require 'spec_helper'

module Overriaktion
  describe RiakNode do 
    subject { RiakNode.new(JSON.parse(Responses::JSON::RIAK_NODE)) }

    specify { subject.id.should == 1 }
    specify { subject.ip_address.should == "127.0.0.1" } 
    specify { subject.port.should == "8098" }
    specify { subject.username.should == "root" }

    it "returns it's riak cluster" do 
      VCR.use_cassette('riak cluster') do 
        riak_cluster = subject.riak_cluster
        riak_cluster.should be_a_kind_of(RiakCluster)
      end
    end
  end
end
