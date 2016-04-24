MANDRILL_API_KEY = ENV['MANDRILL_API_KEY']

puts MANDRILL_API_KEY

ActionMailer::Base.smtp_settings = {
    address: "smtp.mandrillapp.com",
    port: 587, #2525,
    enable_starttls_auto: true,
    user_name: "c.derche@me.com",
    password: MANDRILL_API_KEY,
    authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"