class Instruction < ActiveRecord::Base
  belongs_to :product
  belongs_to :language
  
  validates :language,     presence: true
  validates :product,     presence: true
end
