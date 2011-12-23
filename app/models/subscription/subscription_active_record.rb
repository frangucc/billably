class Subscription < ActiveRecord::Base
  belongs_to :merchant
  has_many :packages

  validates :area, :presence => true
  validates :merchant, :presence => true
  validates :name, :presence => true
  validates :order, :numericality => {:only_integer => true,
    :greater_than_or_equal_to => 0}
  validates :zipcode, :presence => true, :zipcode => true
end
