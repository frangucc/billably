class DateTypeValidator < ActiveModel::Validator
  def validate(record)
    options[:fields].each do |field|
      record.errors.add(field, "must be a Date.") unless
        record.send(field).nil? || record.send(field).is_a?(Date)
    end
  end
end
