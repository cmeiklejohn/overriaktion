require 'spec_helper'

module Overriaktion
  describe Model do 
    subject { model }

    let(:model) { Model.new } 

    it 'grabs an instance of the client' do 
      subject.send(:client).should be_an_instance_of(Client)
    end
    
    context 'with an attribute' do 
      let(:model) { Model.new(:id => 1) } 

      specify { subject.id.should == 1 }
    end
  end
end
