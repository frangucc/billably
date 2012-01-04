require 'spec_helper'

describe Subscription do
  describe 'Factories' do
    it { build(:subscription).valid?.should == true }
  end

  describe 'Validations' do
    it 'should not permit the list of categories to be empty' do
      s = build :subscription, :categories => []
      s.valid?.should == false
      s.errors.messages[:categories].should == ['cannot be empty']
      s.categories << create(:category)
      s.valid?.should == true
    end
  end
end
