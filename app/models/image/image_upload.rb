class Image < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
end
