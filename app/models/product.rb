class Product < ActiveRecord::Base
  include Uuid
  after_initialize :set_default_published, :if => :new_record?
  
  scope :published, -> { where(published: true) }
  
  belongs_to  :company
  has_many    :instructions
  
  def set_default_published
    self.published ||= false
  end
  
  validates :name,        presence: true
  validates :company,     presence: true
  
  validates :name,        uniqueness: true
  validates :uuid,        uniqueness: true
  
end