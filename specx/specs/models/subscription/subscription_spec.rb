require 'specx_helper'

support_require 'database'

app_require 'lib/validators/string_type_validator'
app_require 'lib/validators/date_type_validator'
app_require 'lib/validators/zipcode_validator'
app_require 'app/models/category/category_active_record'
app_require 'app/models/subscription/subscription_active_record'

describe Subscription do
  describe "Associations" do
    it { should belong_to :merchant }
    it { should have_and_belong_to_many :categories }
  end

  describe 'Database Columns' do
    it { should have_db_column(:area).of_type(:string) }
    it { should have_db_column(:blurb).of_type(:text) }
    it { should have_db_column(:etc).of_type(:string) }
    it { should have_db_column(:fine_print).of_type(:text) }
    it { should have_db_column(:featured).of_type(:boolean) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:merchant_id).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:offering).of_type(:string) }
    it { should have_db_column(:order).of_type(:integer) }
    it { should have_db_column(:refundable).of_type(:boolean) }
    it { should have_db_column(:shipping_info).of_type(:string) }
    it { should have_db_column(:shipping_radius_in_miles).of_type(:integer) }
    it { should have_db_column(:refundable).of_type(:boolean) }
    it { should have_db_column(:ships_internationally).of_type(:boolean) }
    it { should have_db_column(:ships_nationally).of_type(:boolean) }
    it { should have_db_column(:zipcode).of_type(:string) }
  end

  describe 'Validations' do
    it { should validate_presence_of :area }
    it { should validate_presence_of :description }
    it { should validate_presence_of :merchant }
    it { should validate_presence_of :name }
    it { should validate_presence_of :zipcode }

    it { should allow_value('regional').for(:area) }
    it { should allow_value('national').for(:area) }
    it { should_not allow_value('').for(:area) }
    it { should_not allow_value(' ').for(:area) }
    it { should_not allow_value(1).for(:area) }

    it { should allow_value(1).for(:order) }
    it { should_not allow_value('').for(:order) }
    it { should_not allow_value(' ').for(:order) }
    it { should_not allow_value(-1).for(:order) }
    it { should_not allow_value(9.2).for(:order) }

    it { should allow_value(1).for(:shipping_radius_in_miles) }
    it { should_not allow_value(0).for(:shipping_radius_in_miles) }
    it { should_not allow_value(-1).for(:shipping_radius_in_miles) }
    it { should_not allow_value('abc').for(:shipping_radius_in_miles) }

    it { should allow_value('12345').for(:zipcode) }
    it { should allow_value('12345-6789').for(:zipcode) }
    it { should_not allow_value('1234').for(:zipcode) }
    it { should_not allow_value('123456789').for(:zipcode) }
    it { should_not allow_value(12345).for(:zipcode) }
  end
end
