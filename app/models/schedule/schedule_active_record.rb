class Schedule < ActiveRecord::Base
  belongs_to :package

  validates :radium, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :schedule_yaml, :presence => true
  validates :zipcode, :presence => true, :zipcode => true
end
