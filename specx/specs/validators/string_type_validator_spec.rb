require 'specx_helper'
require 'active_model'
require 'faker'

app_require 'lib/validators/string_type_validator'

class StringType 
  include ActiveModel::Validations

  validates_with StringTypeValidator, :fields => [:one_string]
  attr_accessor :one_string
end

describe StringType do
  it { should allow_value('1234').for(:one_string) }
  it { should allow_value('12abc').for(:one_string) }
  it { should allow_value(nil).for(:one_string) }
  it { should_not allow_value(1234).for(:one_string) }
end

