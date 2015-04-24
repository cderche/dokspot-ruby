class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :symbol
  
  after_initialize :set_default_published, :if => :new_record?

  scope :published, -> { where(published: true) }

  has_many :users
  has_many :products
  has_many :orders, through: :products
  
  validates :name,        presence: true
  validates :symbol,      presence: true
  validates :website,     presence: true
  validates :contact,     presence: true
  validates :order_email, presence: true
  
  validates :name,        uniqueness: true
  validates :symbol,      uniqueness: true
  
  def set_default_published
    self.published ||= true
  end
  
  before_save :upcase_symbol

  #Paperclip
  has_attached_file :logo,
    storage: :fog,
    fog_directory: ENV['S3_BUCKET'],
    fog_credentials: {
      aws_access_key_id:      ENV['S3_KEY'],
      aws_secret_access_key:  ENV['S3_SECRET'],
      provider:   'AWS',
      region:     'eu-west-1',
      scheme:     'https'
      #host:               's3-eu-west-1.amazonaws.com',
      #endpoint:           'https://s3-eu-west-1.amazonaws.com',
    }

  do_not_validate_attachment_file_type :logo
  
  private
    
    def upcase_symbol
      self.symbol.upcase!
    end

end