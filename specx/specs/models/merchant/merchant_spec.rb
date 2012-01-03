require 'specx_helper'

support_require 'database'

app_require 'lib/validators/zipcode_validator'
app_require 'app/models/merchant/merchant_active_record'
app_require 'app/models/subscription/subscription_active_record'
app_require 'app/models/package/package_active_record'

describe Merchant do
  describe "Associations" do
    it { should have_many :images }
    it { should have_many(:packages).through(:subscriptions) }
    it { should have_many :subscriptions }
  end

  describe 'Database Columns' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:featured).of_type(:boolean) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:zipcode).of_type(:string) }
  end

  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_presence_of :zipcode }

    it { should allow_value('12345').for(:zipcode) }
    it { should allow_value('12345-6789').for(:zipcode) }

    it { should_not allow_value('').for(:zipcode) }
    it { should_not allow_value(' ').for(:zipcode) }
    it { should_not allow_value('1234').for(:zipcode) }
    it { should_not allow_value('123456789').for(:zipcode) }
    it { should_not allow_value(12345).for(:zipcode) }
  end
end
