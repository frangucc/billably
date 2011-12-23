require 'specx_helper'

support_require 'database'

app_require 'lib/validators/zipcode_validator'
app_require 'app/models/schedule/schedule_active_record'

describe Schedule do
  describe 'Associations' do
    it { should belong_to :package }
  end

  describe "Database Columns" do
    it { should have_db_column(:radium).of_type(:float) }
    it { should have_db_column(:schedule_yaml).of_type(:text) }
    it { should have_db_column(:zipcode).of_type(:string) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:radium) }
    it { should validate_presence_of(:schedule_yaml) }
    it { should validate_presence_of(:zipcode) }

    it { should_not allow_value(-1).for(:radium) }
    it { should allow_value(0).for(:radium) }

    it { should allow_value('12345').for(:zipcode) }
    it { should allow_value('21345-2345').for(:zipcode) }
    it { should_not allow_value(12345).for(:zipcode) }
    it { should_not allow_value('2345').for(:zipcode) }
    it { should_not allow_value('a1234').for(:zipcode) }
  end
end
