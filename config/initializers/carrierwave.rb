if Rails.env.development? or Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    # config.enable_processing = false
    config.ignore_integrity_errors = false
    config.ignore_processing_errors = false
    config.ignore_download_errors = false
  end
else #Production, staging, etc.
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog-aws'                        # required
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
      aws_secret_access_key: ENV['AWS_SECRET_KEY'],                        # required
      # region:                'eu-west-1',                  # optional, defaults to 'us-east-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'admin'                          # required
    config.fog_public     = false                                        # optional, defaults to true
    config.fog_attributes = { 
      'Cache-Control' => "max-age=#{365.day.to_i}", 
      'x-amz-server-side-encryption' => 'AES256'
    } # optional, defaults to {}
  end
end
