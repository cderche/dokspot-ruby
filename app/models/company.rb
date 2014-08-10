class Company < ActiveRecord::Base

  has_many :users
  
  validates :name,        presence: true
  validates :symbol,      presence: true
  validates :website,     presence: true
  validates :contact,     presence: true
  validates :order_email, presence: true
  
  validates :name,        uniqueness: true
  validates :symbol,      uniqueness: true

end
