require 'specx_helper'

support_require 'database'

app_require 'lib/validators/date_type_validator'
app_require 'app/models/chargify/chargify_active_record'
app_require 'app/models/purchase/purchase_active_record'

describe Chargify do
  describe "Associations" do
    it { should have_many :purchases }
  end

  describe "Database Columns" do
    it { should have_db_column(:archived_at).of_type(:datetime) }
    it { should have_db_column(:code).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:expiration_interval).of_type(:integer) }
    it { should have_db_column(:expiration_interval_unit).of_type(:string) }
    it { should have_db_column(:initial_charge_in_cents).of_type(:integer) }
    it { should have_db_column(:interval).of_type(:integer) }
    it { should have_db_column(:interval_unit).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:price_in_cents).of_type(:integer) }
    it { should have_db_column(:request_credit_card).of_type(:boolean) }
    it { should have_db_column(:require_credit_card).of_type(:boolean) }
    it { should have_db_column(:return_params).of_type(:string) }
    it { should have_db_column(:return_url).of_type(:string) }
    it { should have_db_column(:schedule_yaml).of_type(:text) }
    it { should have_db_column(:trial_interval).of_type(:integer) }
    it { should have_db_column(:trial_price_in_cents).of_type(:integer) }
    it { should have_db_column(:trial_interval_unit).of_type(:string) }
    it { should have_db_column(:update_return_url).of_type(:string) }
  end

  describe "Validations" do
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:schedule_yaml) }
  end
end
