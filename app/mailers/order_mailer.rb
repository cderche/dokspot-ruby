class OrderMailer < BaseMandrillMailer

  def company_confirmation(order)
    recipient = order.instruction.product.company.order_email
    subject   = "dokspot: New Order"
    merge_vars = {
      "FULL_NAME"     =>  order.customer.full_name                    ,
      "COMPANY"       =>  order.customer.company                      ,
      "ADDRESS_1"     =>  order.customer.address1                     ,
      "ADDRESS_2"     =>  order.customer.address2                     ,
      "POSTCODE"      =>  order.customer.postcode                     ,
      "CITY"          =>  order.customer.city                         ,
      "COUNTRY"       =>  order.customer.country                      ,
      "TELEPHONE"     =>  order.customer.telephone                    ,
      "NOTES"         =>  order.customer.notes                        ,
      "PRODUCT_NAME"  =>  order.instruction.product.name              ,
      "PRODUCT_UUID"  =>  order.instruction.product.uuid              ,
      "ORDER_URL"     =>  ENV['DOMAIN_NAME'] + order_path(order)      ,
      "LOGO_URL"      =>  order.instruction.product.company.logo.url  ,
      "LANGUAGE"      =>  order.instruction.language.name             ,
    }
    body = mandrill_template("dokspot-order-company-new", merge_vars)

    send_email(recipient, subject, body)
  end

  def customer_confirmation(order)
    recipient = order.customer.email
    subject   = "dokspot: New Order"
    merge_vars = {
      "FULL_NAME"     =>  order.customer.full_name                    ,
      "COMPANY"       =>  order.customer.company                      ,
      "ADDRESS_1"     =>  order.customer.address1                     ,
      "ADDRESS_2"     =>  order.customer.address2                     ,
      "POSTCODE"      =>  order.customer.postcode                     ,
      "CITY"          =>  order.customer.city                         ,
      "COUNTRY"       =>  order.customer.country                      ,
      "TELEPHONE"     =>  order.customer.telephone                    ,
      "NOTES"         =>  order.customer.notes                        ,
      "PRODUCT_NAME"  =>  order.instruction.product.name              ,
      "PRODUCT_UUID"  =>  order.instruction.product.uuid              ,
      "ORDER_URL"     =>  ENV['DOMAIN_NAME'] + order_path(order)      ,
      "LOGO_URL"      =>  order.instruction.product.company.logo.url  ,
      "LANGUAGE"      =>  order.instruction.language.name             ,
    }
    body = mandrill_template("dokspot-order-customer-new", merge_vars)

    send_email(recipient, subject, body)
  end

  def customer_cancel(order)
    recipient = order.customer.email
    subject   = "dokspot: Cancelled Order"
    merge_vars = {}
    body = mandrill_template("dokspot-order-customer-cancel", merge_vars)

    send_email(recipient, subject, body)
  end

  def company_cancel(order)
    recipient = order.instruction.product.company.order_email
    subject   = "dokspot: Cancelled Order"
    merge_vars = {
      "FULL_NAME"     =>  order.customer.full_name                    ,
      "COMPANY"       =>  order.customer.company                      ,
      "ADDRESS_1"     =>  order.customer.address1                     ,
      "ADDRESS_2"     =>  order.customer.address2                     ,
      "POSTCODE"      =>  order.customer.postcode                     ,
      "CITY"          =>  order.customer.city                         ,
      "COUNTRY"       =>  order.customer.country                      ,
      "TELEPHONE"     =>  order.customer.telephone                    ,
      "NOTES"         =>  order.customer.notes                        ,
      "PRODUCT_NAME"  =>  order.instruction.product.name              ,
      "PRODUCT_UUID"  =>  order.instruction.product.uuid              ,
      "ORDER_URL"     =>  ENV['DOMAIN_NAME'] + order_path(order)      ,
      "LOGO_URL"      =>  order.instruction.product.company.logo.url  ,
      "LANGUAGE"      =>  order.instruction.language.name             ,
    }
    body = mandrill_template("dokspot-order-company-cancel", merge_vars)

    send_email(recipient, subject, body)
  end

end
