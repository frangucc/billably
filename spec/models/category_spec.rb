require 'spec_helper'

describe Category do
  describe "Factory" do
    it { build(:category).should be_valid }

    it "should contain at least one image" do
      category = create :category
      category.image.should_not be_nil
    end
  end
 
end
