require 'spec_helper'

describe Merchant do
  describe "Factory" do
    it { build(:merchant).should be_valid }
    
    it "should contain at least one image" do
      merchant = create :merchant
      merchant.images.should_not be_empty
    end
  end
 
end
