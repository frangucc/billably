require 'specx_helper'
require 'active_model'
require 'faker'

app_require 'lib/validators/zipcode_validator'

class Zipcode
  include ActiveModel::Validations

  validates :zipcode_validator, :zipcode => true
  attr_accessor :zipcode_validator
end

describe Zipcode do
  it { should allow_value('12345').for(:zipcode_validator) }
  it { should allow_value('12345-6789').for(:zipcode_validator) }

  it { should_not allow_value(nil).for(:zipcode_validator) }
  it { should_not allow_value('').for(:zipcode_validator) }
  it { should_not allow_value(' ').for(:zipcode_validator) }
  it { should_not allow_value('1234').for(:zipcode_validator) }
  it { should_not allow_value('123456789').for(:zipcode_validator) }
  it { should_not allow_value(12345).for(:zipcode_validator) }
  it { should_not allow_value('1234a').for(:zipcode_validator) }
  it { should_not allow_value('1234a-1234').for(:zipcode_validator) }
  it { should_not allow_value('12345-123a').for(:zipcode_validator) }
end
