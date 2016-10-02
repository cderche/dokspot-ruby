class CustomerMailer < ActionMailer::Base
  default from: "orders@dokspot.com"

  # def new_order(order)
  #   @order = order
  #
  #   product = @order.instruction.product
  #   language = @order.instruction.language
  #
  #   mail(to: @order.customer.email, subject: "Order Received: #{product.name} - #{language.name}")
  # end
  #
  # def cancelled_order(order)
  #   @order = order
  #
  #   mail(to: @order.customer.email, subject: "Order #{@order.token} Cancelled")
  # end

  def new_lead(customer)
    @customer = customer
    mail(to: "talk@dokspot.com", subject: "New Lead", from: "notifications@dokspot.com")
  end

  def new_callback_dokspot(customer)
    @customer = customer
    #@product = product
    mail(to: "callback@dokspot.com", subject: "Contact Manufacturer", from: "notifications@dokspot.com")
  end

  def new_callback_manufacturer(customer)
    @customer = customer
    #@product = product
    mail(to: @customer.product.company.contact, subject: "dokspot: contact manufacturer request", from: "notifications@dokspot.com")
  end

  def new_callback_customer(customer)
    @customer = customer
    #@product = product
    mail(to: @customer.email, subject: "dokspot: contact manufacturer", from: "notifications@dokspot.com")
  end

end
