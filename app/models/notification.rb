class Notification < ActiveRecord::Base
  belongs_to :product
  after_initialize :set_default_published, :if => :new_record?
  
  enum category: [:alert, :warning]
  
  def set_default_published
    self.published ||= false
  end
  
  validates :content,     presence: true
  validates :expiration,  presence: true
  validates :product,     presence: true
  validates :category,    presence: true

end
