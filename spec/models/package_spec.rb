require 'spec_helper'

describe Package do
  describe 'Factories' do
    it { build(:package).valid?.should == true }

    it "should contain at least one image" do
      package = create :package
      package.images.should_not be_empty
    end
  end

  describe 'Validations' do
    it 'Should limit three in subscription' do
      subscription = create :subscription
      create_list :package, 3, :subscription => subscription
      package = build :package, :subscription => subscription
      package.valid?.should be_false
    end
  end
end
