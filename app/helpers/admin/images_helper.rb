module Admin::ImagesHelper
  def s3_uploader(options = {})
    options[:s3_config_filename] ||= "#{Rails.root}/config/s3.yml"
    config = YAML.load_file(options[:s3_config_filename])[Rails.env].symbolize_keys
    bucket            = config[:bucket]
    access_key_id     = config[:access_key_id]
    secret_access_key = config[:secret_access_key]

    options[:key] ||= 'test'  # folder on AWS to store file in
    options[:acl] ||= 'public-read'
    options[:expiration_date] ||= 10.hours.from_now.utc.iso8601
    options[:max_filesize] ||= 500.megabytes
    options[:content_type] ||= 'images/' # Videos would be binary/octet-stream
    options[:filter_title] ||= 'All'
    options[:filter_extentions] ||= 'jpg,jpeg,gif,png,bmp,pdf,docx'
    options[:browse_button] ||= 'pickfiles'
    options[:button_text] ||= 'Select File'
    options[:stored_folder] ||= 'attachment'
    id = options[:id] ? "_#{options[:id]}" : ''
    folder = UUID.generate

    policy = Base64.encode64(
      "{'expiration': '#{options[:expiration_date]}',
        'conditions': [
          {'bucket': '#{bucket}'},
          {'acl': '#{options[:acl]}'},
          {'success_action_status': '201'},
          ['content-length-range', 0, #{options[:max_filesize]}],
          ['starts-with', '$key', ''],
          ['starts-with', '$Content-Type', ''],
          ['starts-with', '$name', ''],
          ['starts-with', '$Filename', '']
        ]
      }").gsub(/\n|\r/, '')

    signature = Base64.encode64(
                  OpenSSL::HMAC.digest(
                    OpenSSL::Digest::Digest.new('sha1'),
                    secret_access_key, policy)).gsub("\n","")

    out = ""
    upload_url = "http://#{bucket}.s3.amazonaws.com/"
    out << javascript_tag("
      var upload_url = 'http://#{bucket}.s3.amazonaws.com/';
          acl_option = '#{options[:acl]}';
          content_type_option = '#{options[:content_type]}',
          access_key_id = '#{access_key_id}';
          upload_policy = '#{policy}';
          upload_signature = '#{signature}';
          option_filter_title = '#{options[:filter_title]}';
          option_filter_extension = '#{options[:filter_extentions]}';
          path_to_file = '#{folder}';
    ")

  end
end

