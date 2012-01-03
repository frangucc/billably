class ImageJob < Struct.new(:image, :path)
   def perform
     Rails.logger.info "Processing Image in background-----------------"
     Rails.logger.info "#{image.inspect}"
     Image.process_in_background(image, path)
   end
end
