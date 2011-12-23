require 'spec_helper'

describe ICalendar do
  describe "Database Columns" do
    it { should have_db_column(:schedule_yaml).of_type(:text) }
  end

  describe "Validations" do
    it { should validate_presence_of(:schedule_yaml) }
  end
end
