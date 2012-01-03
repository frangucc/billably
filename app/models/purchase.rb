class Purchase < ActiveRecord::Base
  include ScheduleAttributes

  concerned_with :purchase_active_record

end

