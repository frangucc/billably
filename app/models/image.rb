require "#{Rails.root}/lib/jobs/image_job.rb"
class Image < ActiveRecord::Base
  concerned_with :image_active_record, :image_upload
  
  def self.process_in_background(image, path)
    image.remote_attachment_url = image.remote_attachment_net_url = path
    image.processing = false
    image.save!
  end

  def save_and_process_attachment(options = {now: true})
    if options[:now]
      self.remote_attachment_url = self.remote_attachment_net_url
      save!
    else
      path = self.remote_attachment_net_url
      self.remote_attachment_net_url = nil
      self.remote_attachment_url = nil
      self.processing = true
      save!
      Delayed::Job.enqueue(ImageJob.new(self, path))
    end
  end
end
