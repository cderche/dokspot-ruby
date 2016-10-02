class UserMailer < Devise::Mailer
	#helper :application
	include Devise::Controllers::UrlHelpers
	#default template_path: 'devise/mailer/user_mailer'

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new ENV['MANDRILL_API_KEY']
	end

	def send_email(template_name, record, args)
		puts "Sending " + template_name + " to " + record.email

		template_content = []
  	message = {
  		subaccount: "dokspot",
			to: [{email: record.email }],
			merge_vars: [
				{
					rcpt: record.email,
					vars: args
				}
			]
		}

		async = false
    ip_pool = "Main Pool"
    begin
	    result = mandrill_client.messages.send_template template_name, template_content, message, async, ip_pool
	    puts 'Result ' + result.join(",")
		#puts "Message has been sent to Mandrill"
		rescue Mandrill::Error => e
	    # Mandrill errors are thrown as exceptions
	    puts "A mandrill error occurred: #{e.class} - #{e.message}"
	    # A mandrill error occurred: Mandrill::UnknownSubaccountError - No subaccount exists with the id 'customer-123'
	    raise
		end

	end

	def confirmation_instructions(record, token, opts={})
		args = [{
			name: "ACTIVATION_LINK",
			content: confirmation_url(record, confirmation_token: token)
		}]
  	template_name = "dokspot-account-invitation"
  	send_email template_name, record, args
	end

	def reset_password_instructions(record, token, opts={})
		args = [{
			name: "RESET_LINK",
			content: edit_password_url(record, reset_password_token: token)
		}]

  	template_name = "dokspot-account-reset"
  	send_email template_name, record, args
  end

  def unlock_instructions(record, token, opts={})
  	args = [{
			name: "UNLOCK_LINK",
			content: unlock_url(record, unlock_token: token)
		}]

  	template_name = "dokspot-account-unlock"
  	send_email template_name, record, args
  end

  def invitation_instructions(record, opts={})
  	args = [{
			name: "INVITATION_LINK",
			content: accept_invitation_url(record, :invitation_token => opts)
		}]

  	template_name = "dokspot-account-invitation"
  	send_email template_name, record, args
	end

end
