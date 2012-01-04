class Category < ActiveRecord::Base
  has_and_belongs_to_many :subscriptions

  validates :name, :presence => true, :length => { :maximum => 30 }
  validates :order, :numericality => {:only_integer => true,
    :greater_than_or_equal_to => 0}
end
