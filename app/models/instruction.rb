class Instruction < ActiveRecord::Base
  belongs_to  :product
  belongs_to  :language
  has_many    :documents
  has_many    :orders
  
  accepts_nested_attributes_for :documents
	
	# update for surgical guide, must make db changes.
	enum category: {
		ifu:				1,
		surgical:		2
	}
  
  validates :language,     presence: true
  validates :product,      presence: true
  #validates :category,     presence: true
  
  scope :published, -> { where(published: true) }
  
  def primary
    self.documents.where(primary: true).first
  end
  
end
