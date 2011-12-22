class Merchant < ActiveRecord::Base
  has_many :images
  has_many :packages, :through => :subscriptions
  has_many :subscriptions

  validates :email, :presence => true
  validates :name, :presence => true
  validates :zipcode, :presence => true, :zipcode => true
end
