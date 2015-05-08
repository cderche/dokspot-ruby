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
    puts "Entered Callback Function"
    
    authorize Customer
    puts "Received Authorization"
    
    @product = Product.find(customer_params[:product_id])
    puts "Found Product"
    
    @customer = Customer.new
    @customer.telephone = customer_params[:telephone]
    @customer.reason = :callback
    @customer.status = :open
    
    @customer.full_name = customer_params[:full_name]
    @customer.company   = "empty"
    @customer.product   = @product
    #@customer.notes     = @product.uuid
    @customer.notes     = customer_params[:notes]
    @customer.email     = customer_params[:email]
    @customer.email_confirmation     = customer_params[:email_confirmation]
    @customer.address1  = "empty"
    @customer.address2  = "empty"
    @customer.postcode  = "empty"
    @customer.city      = "empty"
    @customer.country   = customer_params[:country]
    
    puts "Created Customer"
    
    respond_to do |format|
      if @customer.save    
        CustomerMailer.new_callback_dokspot(@customer).deliver
        puts "Sent email 1"
        CustomerMailer.new_callback_manufacturer(@customer).deliver
        puts "Sent email 2"
        CustomerMailer.new_callback_customer(@customer).deliver
        puts "Sent email 3"
        format.html { redirect_to @product, notice: "You will be contacted." }
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
      params.require(:customer).permit(:full_name, :company, :notes, :telephone, :email, :email_confirmation, :country, :product_id, :notes)
    end
  
end
