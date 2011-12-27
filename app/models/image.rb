class Image < ActiveRecord::Base
  concerned_with :image_active_record, :image_upload

  def save_and_process_attachment(options = {now: true})
    if options[:now]
      self.remote_attachment_url = self.remote_attachment_net_url
      save!
    else
      Resque.enqueue(AvatarProcessor, attributes)
    end
  end
end
