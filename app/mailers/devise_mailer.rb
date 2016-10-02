class DeviseMailer < BaseMandrillMailer
  include Devise::Controllers::UrlHelpers

  def invitation_instructions(record, token, opts={})
    puts "DeviseMailer.invitation_instructions"

  	merge_vars = {
			"INVITATION_LINK" => accept_invitation_url(record, :invitation_token => token)
		}

    recipient = record.email
    subject   = "dokspot: Invitation"
  	body = mandrill_template("dokspot-account-invitation", merge_vars)
    send_email(recipient, subject, body)
	end

  def unlock_instructions(record, token, opts={})
  	merge_vars = {
			"UNLOCK_LINK"  => unlock_url(record, unlock_token: token)
		}

    recipient = record.email
    subject   = "dokspot: Unlock Your Account"
  	body = mandrill_template("dokspot-account-unlock", merge_vars)
    send_email(recipient, subject, body)
  end

  def reset_password_instructions(record, token, opts={})
		merge_vars = {
			"RESET_LINK" => edit_password_url(record, reset_password_token: token)
		}

    recipient = record.email
    subject   = "dokspot: Reset your password"
  	body = mandrill_template("dokspot-account-reset", merge_vars)
    send_email(recipient, subject, body)
  end

  def confirmation_instructions(record, token, opts={})
		merge_vars = {
      "ACTIVATION_LINK" => confirmation_url(record, confirmation_token: token)
		}
  	template_name = "dokspot-account-activation"

    recipient = record.email
    subject   = "dokspot: Activate Your Account"
  	body = mandrill_template("dokspot-account-activation", merge_vars)
    send_email(recipient, subject, body)
	end

end
