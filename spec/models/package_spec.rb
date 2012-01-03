require 'spec_helper'

describe Package do
  describe "Associations" do
    it { should have_many :images }

  end

  describe "Class Methods" do
  end

  describe "Database Columns" do
  end

  describe "Validations" do
    it { should_not allow_value(Time.now).for(:delivery_date) }
    it "Should limit three in subscription" do
      subscription = create :subscription
      create_list :package, 3, :subscription => subscription
      package = build :package, :subscription => subscription
      package.valid?.should be_false
    end
  end

end

