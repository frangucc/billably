class Chargify < ActiveRecord::Base
  has_many :purchases

  validates :schedule_yaml, :presence => true
end
