

ActionMailer::Base.smtp_settings = {
    address:                "smtp.mandrillapp.com"  ,
    port:                   "587"                   ,
    enable_starttls_auto:   true                    ,
    user_name:              ENV['MANDRILL_USER']    ,
    password:               ENV['MANDRILL_API_KEY'] ,
    authentication:         :login                  ,
    domain:                 "dokspot.com"           ,
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"

# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.default_url_options = { host: "localhost:3000" }
