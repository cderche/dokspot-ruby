class CustomersController < ApplicationController
  skip_before_filter :authenticate_user!
  after_action :verify_authorized
  
  def contact
    authorize Customer
    
    @customer = Customer.new(customer_params)
    @customer.reason = :lead
    @customer.status = :open
    
    @customer.address1 = "empty"
    @customer.address2 = "empty"
    @customer.postcode = "empty"
    @customer.city = "empty"
    @customer.country = "empty"
    
    CustomerMailer.new_lead(@customer).deliver
    
    respond_to do |format|
      if @customer.save
        format.html { redirect_to about_path }
      else
        format.html { redirect_to about_path }
      end
    end
    
  end
  
  def callback
    authorize Customer
    
    @product = Product.find(customer_params[:product_id])
    
    @customer = Customer.new
    @customer.telephone = customer_params[:telephone]
    @customer.reason = :callback
    @customer.status = :open
    
    @customer.full_name = customer_params[:full_name]
    @customer.company   = "empty"
    @customer.notes     = @product.uuid
    @customer.email     = customer_params[:email]
    @customer.email_confirmation     = customer_params[:email_confirmation]
    @customer.address1  = "empty"
    @customer.address2  = "empty"
    @customer.postcode  = "empty"
    @customer.city      = "empty"
    @customer.country   = customer_params[:country]
    
    puts @customer.country
    
    respond_to do |format|
      if @customer.save
        CustomerMailer.new_callback(@customer, @product).deliver
        format.html { redirect_to @product, notice: "Thank you! We will contact you soon!" }
      else
        format.html { redirect_to @product, error: "Unfortunately your request could not be handled." }
      end
    end
  end
    
  def close
    authorize Customer
    @customer = Customer.find(params[:id])
    @customer.status = :closed
    @customer.save
    redirect_to companies_path
  end
  
  private 
  
    def customer_params
      params.require(:customer).permit(:full_name, :company, :notes, :telephone, :email, :email_confirmation, :country, :product_id)
    end
  
end
