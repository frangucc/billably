class Merchant < ActiveRecord::Base
  has_many :images, :as => :imageable
  has_many :packages, :through => :subscriptions
  has_many :subscriptions

  accepts_nested_attributes_for :images

  validates :email, :presence => true
  validates :name, :presence => true
  validates :zipcode, :presence => true, :zipcode => true
end
