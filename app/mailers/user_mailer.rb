class UserMailer < Devise::Mailer
	#helper :application
	include Devise::Controllers::UrlHelpers
	#default template_path: 'devise/mailer/user_mailer'

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	end

	def send_email(template_name, record, link)
		puts "Sending " + template_name + " to " + record.email

		template_content = []
  	message = {
			to: [{email: record.email }],
			merge_vars: [
				{ 
					rcpt: record.email,
					vars: [
						{
							name: "LINK", content: link
						}
					]
				}
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message
		puts "Message has been sent to Mandrill"
	end

	def confirmation_instructions(record, token, opts={})
		link = confirmation_url(record, confirmation_token: token)
    	template_name = "user-confirmation"

    	send_email template_name, record, link
	end

	def reset_password_instructions(record, token, opts={})
    	link = edit_password_url(record, reset_password_token: token)
    	template_name = "user-reset"

    	send_email template_name, record, link
    end

    def unlock_instructions(record, token, opts={})
    	link = unlock_url(record, unlock_token: token)
    	template_name = "user-unlock"

    	send_email template_name, record, link
    end

    def invitation_instructions(record, opts={})
    	link = accept_invitation_url(record, :invitation_token => opts)
    	template_name = "user-invitation"

    	send_email template_name, record, link
	end

end