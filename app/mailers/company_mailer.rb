class CompanyMailer < ActionMailer::Base
  default from: "orders@dokspot.com"
  
  def new_order(order)
    @order = order
    
    product = @order.instruction.product
    language = @order.instruction.language
    
    company = @order.instruction.product.company
    
    mail(to: company.order_email, subject: "New Order Request: #{product.name} - #{language.name}")
  end
  
  def cancelled_order(order)
    @order = order
    
    company = @order.instruction.product.company
    
    mail(to: company.order_email, subject: "Order #{@order.token} Cancelled")
  end
  
end