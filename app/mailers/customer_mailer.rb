class CustomerMailer < ActionMailer::Base
  default from: "orders@dokspot.com"
  
  def new_order(order)
    @order = order
    
    product = @order.instruction.product
    language = @order.instruction.language
    
    mail(to: @order.customer.email, subject: "Order Received: #{product.name} - #{language.name}")
  end
  
  def cancelled_order(order)
    @order = order
    
    mail(to: @order.customer.email, subject: "Order #{@order.token} Cancelled")
  end
  
  def new_lead(customer)
    @customer = customer
    mail(to: "talk@dokspot.com", subject: "New Lead", from: "notifications@dokspot.com")
  end
  
  def new_callback(customer, product)
    @customer = customer
    @product = product
    mail(to: "callback@dokspot.com", subject: "Call Back Request", from: "notifications@dokspot.com")
  end
  
end