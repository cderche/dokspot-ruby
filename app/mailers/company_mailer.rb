class CompanyMailer < ActionMailer::Base
  default from: "orders@dokspot.com"

  def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	end

  def new_order(order)
    order

    product   = order.instruction.product
    language  = order.instruction.language
    company   = order.instruction.product.company
    customer  = order.customer

    args = [{
        name: "FULL_NAME",
        content: customer.full_name
      },
      {
        name: "COMPANY",
        content: customer.company
      },
      {
        name: "ADDRESS_1",
        content: customer.address1
      },
      {
        name: "ADDRESS_2",
        content: customer.address2
      },
      {
        name: "POSTCODE",
        content: customer.postcode
      },
      {
        name: "CITY",
        content: customer.city
      },
      {
        name: "COUNTRY",
        content: customer.country
      },
      {
        name: "TELEPHONE",
        content: customer.telephone
      },
      {
        name: "NOTES",
        content: customer.notes
      },
      {
        name: "PRODUCT_NAME",
        content: product.name
      },
      {
        name: "LANGUAGE",
        content: language.name
    }]
  	template_name = "dokspot-order-company"
  	send_email template_name, record, args

    # mail(to: company.order_email, subject: "New Order Request: #{product.name} - #{language.name}")
  end

  def cancelled_order(order)
    @order = order

    company = @order.instruction.product.company

    mail(to: company.order_email, subject: "Order #{@order.token} Cancelled")
  end

end
