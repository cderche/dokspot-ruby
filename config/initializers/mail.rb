#MANDRILL_API_KEY = "bSSnAQgslE2rHwsMO1r-nA"
MANDRILL_API_KEY = ENV['MANDRILL_API_KEY']

puts "MANDRILL_API_KEY: " + MANDRILL_API_KEY

ActionMailer::Base.smtp_settings = {
    address: "smtp.mandrillapp.com",
    port: 2525, #587,
    enable_starttls_auto: true,
    user_name: "cyrille.derche@dokspot.com",
    password: MANDRILL_API_KEY,
    authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"