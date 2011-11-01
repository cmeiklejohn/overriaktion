require 'spec_helper'

module Overriaktion
  describe Sample do 
    subject { sample } 

    context 'with a valid configuration' do 
      let(:sample) do
        Sample.new(:id => "1", :ip_address => '127.0.0.1', :port => "8098")
      end

      specify { subject.id.should == '1' }
      specify { subject.port.should == '8098' }
      specify { subject.ip_address.should == '127.0.0.1' } 

      it 'is able to be sampled' do 
        VCR.use_cassette('riak') do 
          subject.perform.should be_true
        end
      end

      it 'is able to be saved' do 
        Client.instance.should_receive(:sample)
        subject.save
      end
    end
  end
end
