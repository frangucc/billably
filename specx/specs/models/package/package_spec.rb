require 'specx_helper'

support_require 'database'

app_require 'lib/validators/string_type_validator'
app_require 'lib/validators/zipcode_validator'
app_require 'lib/validators/date_type_validator'
app_require 'app/models/package/package_active_record'
app_require 'app/models/category/category_active_record'
app_require 'app/models/subscription/subscription_active_record'
app_require 'app/models/purchase/purchase_active_record'

describe Package do
  describe "Associations" do
    it { should belong_to :subscription }
    it { should have_many :images }
    it { should have_many :purchases }
    it { should have_one :schedule }
  end

  describe 'Database Columns' do
    it { should have_db_column(:customer_cost).of_type(:integer) }
    it { should have_db_column(:delivery_date).of_type(:date) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:frequency).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:our_cost).of_type(:integer) }
    it { should have_db_column(:subscription_id).of_type(:integer) }
  end

  describe 'Validations' do
    it { should validate_presence_of :customer_cost }
    it { should validate_presence_of :delivery_date }
    it { should validate_presence_of :description }
    it { should validate_presence_of :frequency }
    it { should validate_presence_of :name }

    it { should allow_value(0).for(:customer_cost) }
    it { should_not allow_value(-1).for(:customer_cost) }
    it { should_not allow_value(1.7).for(:customer_cost) }
    it { should_not allow_value('1.7').for(:customer_cost) }

    it { should_not allow_value(Time.now).for(:delivery_date) }

    it { should_not allow_value(0).for(:frequency) }
    it { should_not allow_value(-1).for(:frequency) }
    it { should_not allow_value(1.2).for(:frequency) }

    it { should_not allow_value('').for(:name) }
    it { should_not allow_value(' ').for(:name) }

    it { should allow_value(0).for(:our_cost) }
    it { should_not allow_value(-1).for(:our_cost) }
    it { should_not allow_value(1.7).for(:our_cost) }
    it { should_not allow_value('1.7').for(:our_cost) }
  end
end
