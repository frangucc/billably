class Purchase < ActiveRecord::Base
  belongs_to :chargify
  belongs_to :package
  belongs_to :user

  validates :card_number,   :length => {:is => 4}
  validates :chargify,      :presence => true
  validates :package,       :presence => true
  validates :purchase_date, :presence => true
  validates :price,         :presence => true,
    :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :user,          :presence => true
end
