if Rails.env.test? or Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end

if Rails.env.production? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                             # required
      :aws_access_key_id      => S3_KEY,                     # required
      :aws_secret_access_key  => S3_SECRET,                  # required
      :region                 => 'eu-west-1',                       # optional, defaults to 'us-east-1'
      #:host                   => 's3.example.com',                  # optional, defaults to nil
      #:endpoint               => 'https://s3.example.com:8080'      # optional, defaults to nil
    }
    config.fog_directory  = 'dokspot-development'                   # required
    config.fog_public     = true                                    # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end