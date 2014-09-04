class Product < ActiveRecord::Base
  extend FriendlyId
  friendly_id :uuid
  
  include Uuid
  
  after_initialize :set_default_published, :if => :new_record?
  
  scope :published, -> { where(published: true) }
  
  belongs_to  :company
  has_many    :instructions
  has_many    :notifications
  
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
    storage: :s3,
    s3_credentials: {
      bucket:             ENV['S3_BUCKET'],
      access_key_id:      ENV['S3_KEY'],
      secret_access_key:  ENV['S3_SECRET']
    }
  validates_attachment_content_type :qrcode_png, content_type: "image/png"
  do_not_validate_attachment_file_type :qrcode_svg
  
end