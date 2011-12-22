class Schedule < ActiveRecord::Base
  include ScheduleAttributes

  concerned_with :schedule_active_record
end
