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
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
      :region                 => 'eu-west-1',
      :host                   => 's3-eu-west-1.amazonaws.com',
      :endpoint               => 'https://s3-eu-west-1.amazonaws.com'
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = false
    #config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
    #config.s3_access_policy = 'public-read'
  end
end