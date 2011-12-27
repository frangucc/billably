class Image < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :package
end
