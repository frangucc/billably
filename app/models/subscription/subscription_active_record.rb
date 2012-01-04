class Subscription < ActiveRecord::Base
  belongs_to :merchant
  has_and_belongs_to_many :categories

  validate :at_least_one_category
  validates :area, :presence => true
  validates :merchant, :presence => true
  validates :name, :presence => true
  validates :order, :numericality => {:only_integer => true,
    :greater_than_or_equal_to => 0}
  validates :zipcode, :presence => true, :zipcode => true
  validates_with StringTypeValidator, :fields => [:area]

  private

    def at_least_one_category
      errors.add(:categories, 'cannot be empty') if
        self.categories.size.zero?
    end
end
