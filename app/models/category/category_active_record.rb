class Category < ActiveRecord::Base
  has_many :packages
  has_many :categorizations
  has_many :subscriptions, through: :categorizations

  validates :name, :presence => true, :length => { :maximum => 30 }
  validates :order, :numericality => {:only_integer => true,
    :greater_than_or_equal_to => 0}
end
