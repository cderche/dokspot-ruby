### UTILITY ###

def set_role role
  @user.role = role
  @user.save
end

### GIVEN ###

Given(/^I am a manager$/) do
  create_user
  set_role :manager
  sign_in
end

Given(/^I am a operator$/) do
  create_user
  set_role :operator
  sign_in
end

Given(/^I am a admin$/) do
  create_user
  set_role :admin
  sign_in
end

Given(/^I am a visitor$/) do
  sign_out
end

### THEN ###

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end