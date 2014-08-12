Given(/^I am a user$/) do
  create_user
end

Given(/^I am logged in$/) do
  create_user
  sign_in
end

Given(/^I am a admin$/) do
  create_user
  sign_in
  set_role :admin
end

Given(/^I am a manager$/) do
  create_user
  sign_in  
  set_role :manager
end

Given(/^I am a operator$/) do
  create_user
  sign_in
  set_role :operator
end

Given(/^I am a visitor$/) do
  sign_out
end

When(/^I sign in with valid credentials$/) do
  sign_in
end

When(/^I sign in with invalid credentials$/) do
  set_invalid_user_credentials
  sign_in
end