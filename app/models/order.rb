class Order < ActiveRecord::Base
  extend FriendlyId
  friendly_id :token
  
  include Tokenable
  
  before_create :make_new_order
  
  belongs_to :instruction
  belongs_to :customer
  
  accepts_nested_attributes_for :customer
  
  # An order has the following statuses: New, Processing, Shipped. With shipped you can a URL to track the shipment.
  enum status: {
    new_order:  1,
    processed:  2,
    shipped:    3,
    cancelled:  4
  }  
  
  def make_new_order
    self.status = :new_order
  end
  
end