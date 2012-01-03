class Chargify < ActiveRecord::Base
  has_many :purchases

  validates :code, :presence => true
  validates :name, :presence => true
  validates :schedule_yaml, :presence => true
end
