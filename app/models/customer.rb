class Customer < ActiveRecord::Base
	has_many :orders
  
  validates :full_name  , presence: true
  validates :address1   , presence: true
  validates :postcode   , presence: true
  validates :city       , presence: true
  validates :country    , presence: true
  validates :telephone  , presence: true
  validates :email      , presence: true
  
  scope :leads      , -> { where(reason: :lead) }
  scope :callbacks  , -> { where(reason: :callback) }
  
end