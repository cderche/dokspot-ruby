require 'securerandom'

module Uuid
  extend ActiveSupport::Concern
  
  included do
    after_create :generate_uuid
  end
  
  protected
  
    def generate_uuid
      self.uuid = "#{self.company.symbol}#{self.id}"
      self.save
    end
    
end