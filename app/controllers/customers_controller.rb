class CustomersController < ApplicationController
  skip_before_filter :authenticate_user!
  after_action :verify_authorized
  
  def create
    authorize Customer
    
    @customer = Customer.new(customer_params)
    
    @customer.address1 = ""
    @customer.address2 = ""
    @customer.postcode = ""
    @customer.city = ""
    @customer.country = ""
    
    CustomerMailer.new_lead(@customer).deliver
    
    respond_to do |format|
      if @customer.save
        format.html { redirect_to about_path }
      else
        format.html { redirect_to about_path }
      end
    end
    
  end
  
  private 
  
    def customer_params
      params.require(:customer).permit(:full_name, :company, :notes, :telephone, :email)
    end
  
end
