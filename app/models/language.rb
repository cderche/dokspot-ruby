class Language < ActiveRecord::Base
  has_many  :instructions

  validates :name,  presence: true
  validates :local,	presence: true
  
  validates :name,  uniqueness: true
  validates :local,	uniqueness: true
end
