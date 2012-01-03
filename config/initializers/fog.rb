my_config = "#{Rails.root}/config/s3.yml"
s3_credentials = YAML.load_file(my_config)[Rails.env]

CarrierWave.configure do |config|
  unless Rails.env.test?
    config.storage = :fog
    config.fog_directory = s3_credentials['bucket']

    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => s3_credentials['access_key_id'],
      :aws_secret_access_key => s3_credentials['secret_access_key']
    }
  else
    config.storage = :file
  end
end

