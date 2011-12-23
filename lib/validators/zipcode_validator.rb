class ZipcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    format = /^\d{5}(-\d{4})?$/
    record.errors.add attribute, "is invalid" unless
      value.is_a?(String) && value.match(format)
  end
end
