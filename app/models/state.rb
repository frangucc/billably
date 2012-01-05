class State < ActiveRecord::Base
  has_and_belongs_to_many :subscriptions

  validates :name, :presence => true
  validates :abbr, :presence => true
end
