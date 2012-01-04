class Subscription < ActiveRecord::Base
  belongs_to :merchant
  has_and_belongs_to_many :categories
  has_many :packages, :dependent => :destroy
  accepts_nested_attributes_for :packages, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

  validate :at_least_one_category
  validates :area, :presence => true
  validates :description, :presence => true
  validates :merchant, :presence => true
  validates :name, :presence => true
  validates :order, :numericality => {:only_integer => true,
    :greater_than_or_equal_to => 0}
  validates :shipping_radius_in_miles,
    :numericality => {:only_integer => true, :greater_than => 0}
  validates :zipcode, :presence => true, :zipcode => true
  validates_with StringTypeValidator, :fields => [:area]

  private

    def at_least_one_category
      errors.add(:categories, 'cannot be empty') if
        self.categories.size.zero?
    end
end
