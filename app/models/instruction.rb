class Instruction < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :language
  has_many    :documents
  has_many    :orders
  
  accepts_nested_attributes_for :documents
  
  validates :language,     presence: true
  validates :product,     presence: true
  
  scope :published, -> { where(published: true) }
  
  def primary
    self.documents.where(primary: true).first
  end
  
end
