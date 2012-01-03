require 'specx_helper'

support_require 'database'

app_require 'lib/validators/zipcode_validator'
app_require 'lib/validators/date_type_validator'
app_require 'app/models/purchase/purchase_active_record'
app_require 'app/models/package/package_active_record'
app_require 'app/models/user/user_active_record'

describe Purchase do
  describe "Associations" do
    it { should belong_to :chargify }
    it { should belong_to :package }
    it { should belong_to :user }
  end

  describe 'Database Columns' do
    it { should have_db_column(:card_number).of_type(:string) }
    it { should have_db_column(:chargify_id).of_type(:integer) }
    it { should have_db_column(:card_type).of_type(:string) }
    it { should have_db_column(:purchase_date).of_type(:date) }
    it { should have_db_column(:package_id).of_type(:integer) }
    it { should have_db_column(:price).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe 'Validations' do
    it { should validate_presence_of :chargify }
    it { should validate_presence_of :package }
    it { should validate_presence_of :purchase_date }
    it { should validate_presence_of :price }
    it { should validate_presence_of :user }

    it { should allow_value('1234').for(:card_number) }
    it { should_not allow_value('12345').for(:card_number) }
    it { should_not allow_value('123').for(:card_number) }

    it { should_not allow_value(-1).for(:price) }
    it { should_not allow_value(1.7).for(:price) }

    it { should_not allow_value(Time.now + 1.day).for(:purchase_date) }
  end
end

