require 'specx_helper'

support_require 'database'
app_require 'app/models/state'

describe State do
  describe "Associations" do
    it { should have_and_belong_to_many(:subscriptions) }
  end

  describe "Database Columns" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:abbr).of_type(:string) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:abbr) }
  end
end
