class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uuid
  
  include Uuid
  
  after_initialize :set_default_published, :if => :new_record?
  
  scope :published, -> { where(published: true) }
  
  belongs_to  :company
  has_many    :instructions
  has_many    :notifications
  has_many    :languages, through: :instructions
  
  has_many    :orders, through: :instructions

  has_one     :customer
  
  def set_default_published
    self.published ||= false
  end
  
  validates :name,        presence: true
  validates :company,     presence: true
  
  validates :name,        uniqueness: true
  validates :uuid,        uniqueness: true
  
  # Paperclip
  has_attached_file :qrcode_png,
    styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :s3,
    s3_credentials: {
      bucket:             ENV['S3_BUCKET'],
      access_key_id:      ENV['S3_KEY'],
      secret_access_key:  ENV['S3_SECRET']
    }
  has_attached_file :qrcode_svg,
    storage: :fog,
    fog_directory: ENV['S3_BUCKET'],
    fog_credentials: {
      aws_access_key_id:      ENV['S3_KEY'],
      aws_secret_access_key:  ENV['S3_SECRET'],
      provider: 'AWS',
      region:             'eu-west-1',
      scheme:             'https'
      #host:               's3-eu-west-1.amazonaws.com',
      #endpoint:           'https://s3-eu-west-1.amazonaws.com',
    }

  validates_attachment_content_type :qrcode_png, content_type: "image/png"
  do_not_validate_attachment_file_type :qrcode_svg
  
end