class Chargify < ActiveRecord::Base
  include ScheduleAttributes
  concerned_with :chargify_active_record
end
