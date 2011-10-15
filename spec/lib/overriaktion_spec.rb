require 'spec_helper'

module Overriaktion 
  describe self do 
    it 'returns the client when instantiated' do 
      subject.new.should be_a_kind_of(Client)
    end

    it 'returns the same client when instantiated twice' do 
      subject.new.should == subject.new
    end
  end
end
