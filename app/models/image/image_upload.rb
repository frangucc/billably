class Image < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  #process_in_background :attachment
  #store_in_background :attachment
end
