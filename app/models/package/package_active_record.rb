class Package < ActiveRecord::Base
  belongs_to :subscription
  has_one :schedule
  has_many :images
  has_many :purchases

  validate :limit_three_in_subscription
  validates :delivery_date, :presence => true
  validates :description, :presence => true
  validates :frequency, :presence => true,
    :numericality => {:only_integer => true, :greater_than => 0}
  validates :our_cost, :presence => true,
    :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :customer_cost, :presence => true,
    :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :name, :presence => true
  validates_with DateTypeValidator, :fields => [:delivery_date]

  private

    def limit_three_in_subscription
      return unless subscription_id

      number_packages = Package.where(["subscription_id = ? AND id <> ?",
        self.subscription_id, self.id.to_i]).count
      self.errors.add(:base, "limit three packages in subscription") if
        number_packages > 2
    end
end
