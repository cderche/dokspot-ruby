require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
=begin
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'

Rails.application.configure do
  config.paperclip_defaults = {
    storage: :s3,
    url: 's3-eu-west-1.amazonaws.com',
    s3_credentials: {
      bucket:             ENV['S3_BUCKET'],
      access_key_id:      ENV['S3_KEY'],
      secret_access_key:  ENV['S3_SECRET']
    }
  }
end
=end

# Rails.application.configure do
#   config.paperclip_defaults = {
#     storage: :fog,
#     fog_credentials: {
#       aws_access_key_id:      ENV['S3_KEY']     ,
#       aws_secret_access_key:  ENV['S3_SECRET']  ,
#       provider:               'AWS'             ,
#
#     }
#     #   # aws_access_key_id:      ENV['S3_KEY'],
#     #   # aws_secret_access_key:  ENV['S3_SECRET'],
#     #   # provider: 'AWS',
#     #   # region:             'eu-west-1',
#     #   # scheme:             'https'
#     #   # #host:               's3-eu-west-1.amazonaws.com',
#   }
# end
#
# Paperclip::Attachment.default_options[:storage] = :fog
# Paperclip::Attachment.default_options[:fog_credentials] = { provider: "Local", local_root: "#{Rails.root}/public"}
# Paperclip::Attachment.default_options[:fog_directory] = ""
# Paperclip::Attachment.default_options[:fog_host] = "http://localhost:3000"
