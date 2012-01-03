require 'specx_helper'
require 'active_model'
require 'faker'

app_require 'lib/validators/date_type_validator'

class DateType 
  include ActiveModel::Validations

  validates_with DateTypeValidator, :fields => [:one_date]
  attr_accessor :one_date
end

describe DateType do
  it { should allow_value(Date.today).for(:one_date) }
  it { should allow_value(nil).for(:one_date) }
  it { should_not allow_value(123).for(:one_date) }
  it { should_not allow_value('aaaa').for(:one_date) }
  it { should_not allow_value(Time.now).for(:one_date) }
end
