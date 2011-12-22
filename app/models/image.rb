class Image < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader

  belongs_to :merchant
  belongs_to :package

  def save_and_process_attachment(options = {now: true})
    if options[:now]
      self.remote_attachment_url = self.remote_attachment_net_url
      save!
    else
      Resque.enqueue(AvatarProcessor, attributes)
    end
  end
end
