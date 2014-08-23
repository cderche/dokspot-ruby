### UTILITY METHODS ###

def create_visitor
  @visitor ||= { 
    name: "Testy McUserton",
    email: "testy@example.com",
    password: "changeme",
    password_confirmation: "changeme"
  }
end

def find_user
  @user ||= User.where(email: @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  page.driver.submit :delete, destroy_user_session_path, {}
end

def create_user
  create_visitor
  create_company
  @visitor = @visitor.merge(company: @company)
  delete_user
  @user = FactoryGirl.create(:user, @visitor)
end

def delete_user
  find_user
  @user.destroy unless @user.nil?
end

def sign_out
  page.driver.submit :delete, destroy_user_session_path, {}
end  

#def sign_up
#  delete_user
#  visit '/users/sign_up'
#  fill_in "user[name]", with: @visitor[:name]
#  fill_in "user[email]", with: @visitor[:email]
#  fill_in "user[password]", with: @visitor[:password]
#  fill_in "user[password_confirmation]", with: @visitor[:password_confirmation]
#  click_button "Sign up"
#  find_user
#end

def sign_in
  visit new_user_session_path
  fill_in "user_email", with: @visitor[:email]
  fill_in "user_password", with: @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  #visit destroy_user_session_path(@user)
  #visit '/users/sign_out'
  page.driver.submit :delete, destroy_user_session_path, {}
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end

Given /^I exist as an unconfirmed user$/ do
  create_unconfirmed_user
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  sign_out
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(email: "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(password: "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(password_confirmation: "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit root_path
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(email: "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(password: "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit account"
  fill_in "user_name", with: "newname"
  fill_in "user_current_password", with: @visitor[:password]
  click_button "Update"
end

When /^I look at the list of users$/ do
  visit '/'
end

### THEN ###
Then /^I should be signed in$/ do
  expect(page).to have_content "Sign out"
  #expect(page).to_not have_content "Sign up"
  expect(page).to_not have_content "Sign in"
end

Then /^I should be signed out$/ do
  #expect(page).to have_content "Sign up"
  expect(page).to have_content "Sign in"
  expect(page).to_not have_content "Sign out"
end

Then /^I see an unconfirmed account message$/ do
  expect(page).to have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  expect(page).to have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  expect(page).to have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  expect(page).to have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  expect(page).to have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  expect(page).to have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  expect(page).to have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  expect(page).to have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  expect(page).to have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  expect(page).to have_content "You updated your account successfully."
end

Then /^I should see my email$/ do
  create_user
  expect(page).to have_content @user[:email]
end

Then(/^I should see information on each user$/) do
  @company.users.all.each do |user|
    expect(page).to have_content user.email
    if @user.admin?
      expect(page).to have_link I18n.t('delete'), user_path(user)
    elsif @user.manager? and user.operator?
      expect(page).to have_link I18n.t('delete'), user_path(user)
    end
  end
end