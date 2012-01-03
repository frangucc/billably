class StringTypeValidator < ActiveModel::Validator
  def validate(record)
    options[:fields].each do |field|
      record.errors.add(field, "must be a string.") unless
        record.send(field).nil? || record.send(field).is_a?(String)
    end
  end
end

