class User < ActiveRecord::Base
  has_many :authentications
  has_many :packages, :through => :purchases
  has_many :purchases

  validates :email, :presence => true
  validates :zipcode, :presence => true, :zipcode => true
end
