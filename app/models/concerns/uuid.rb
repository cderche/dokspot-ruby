module Uuid
  extend ActiveSupport::Concern
  
  included do
    after_create :generate_uuid
  end
  
  protected
  
    def generate_uuid
      #puts "Generating UUID..."
      self.uuid = "#{self.company.symbol.upcase}#{self.id}"
      self.save
    end
    
end