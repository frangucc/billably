class Purchase < ActiveRecord::Base
  belongs_to :billing, :class_name => "ICalendar"
  belongs_to :package
  belongs_to :serving, :class_name => 'ICalendar'
  belongs_to :user

  
  validates :card_number,   :length => {:is => 4}
  validates :package,       :presence => true
  validates :purchase_date, :presence => true
  validates :price,         :presence => true,
                            :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :user,          :presence => true
  
  accepts_nested_attributes_for :billing, :allow_destroy => true
  accepts_nested_attributes_for :serving, :allow_destroy => true
end
