require 'specx_helper'

support_require 'database'

app_require 'lib/validators/string_type_validator'
app_require 'lib/validators/zipcode_validator'
app_require 'lib/validators/date_type_validator'
app_require 'app/models/category/category_active_record'
app_require 'app/models/package/package_active_record'

describe Category do
  describe "Associations" do
    it { should have_many :packages }
  end

  describe 'Database Columns' do
    it { should have_db_column(:featured).of_type(:boolean) }
    it { should have_db_column(:order).of_type(:integer) }
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'Validations' do
    it { should validate_presence_of :name }

    it { should allow_value('abc').for(:name) }
    it { should_not allow_value('').for(:name) }
    it { should_not allow_value(' ').for(:name) }
    it { should_not allow_value('x' * 33).for(:name) }

    it { should allow_value(1).for(:order) }
    it { should_not allow_value('').for(:order) }
    it { should_not allow_value(' ').for(:order) }
    it { should_not allow_value(-1).for(:order) }
    it { should_not allow_value(9.2).for(:order) }
  end
end

