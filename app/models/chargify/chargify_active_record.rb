class Chargify < ActiveRecord::Base
  has_one :purchase

  validates :schedule_yaml, :presence => true
end
