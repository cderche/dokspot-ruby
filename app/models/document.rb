class Document < ActiveRecord::Base
  mount_uploader :file, DocumentUploader
  
  belongs_to :instruction
  
  scope :primary, -> { where(primary: true) }
  scope :nonprimary, -> { where(primary: false) }
  
  def fileName
    "#{self.instruction.product.name}_#{self.instruction.language.name}_#{self.version}.pdf"
  end
end
