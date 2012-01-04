class Subscription < ActiveRecord::Base
  belongs_to :merchant
  has_many :packages
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :area, :presence => true
  validates :merchant, :presence => true
  validates :name, :presence => true
  validates :order, :numericality => {:only_integer => true,
    :greater_than_or_equal_to => 0}
  validates :zipcode, :presence => true, :zipcode => true
  validates_with StringTypeValidator, :fields => [:area]
end

