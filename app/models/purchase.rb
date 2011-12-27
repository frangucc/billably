class Purchase < ActiveRecord::Base
  concerned_with :purchase_active_record

  include ScheduleAttributes
end
