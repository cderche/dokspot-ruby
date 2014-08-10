def create_visitor
	@visitor ||= {
		name: "John Doe",
		email: "user@example.com",
		password: "changeme",
		password_confirmation: "changeme"
	}
end

def create_user
	create_visitor
	delete_user
	@user = FactoryGirl.create(:user, @visitor)
end

def create_colleague email
	@colleague ||= { email: email }
end

def sign_in
	visit new_user_session_path
	fill_in 'user[email]', with: @visitor[:email]
	fill_in 'user[password]', with: @visitor[:password]
	click_button 'Sign in'
end

def delete_user
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def set_invalid_user_credentials
	@visitor = @visitor.merge(:email => "wrong@example.com")
	@visitor = @visitor.merge(:password => "wrong")
end

def invite
	visit new_user_invitation_path
	fill_in 'user[email]', with: @colleague[:email]
	click_button 'Send an invitation'
end

def set_role role
  @user.role = role
  @user.save
end

def set_user_company
  @user.company = @company
  @user.save
end