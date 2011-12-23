class ICalendar < ActiveRecord::Base
  include ScheduleAttributes
  validates :schedule_yaml, :presence => true
end
