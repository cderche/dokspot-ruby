Given(/^I am a user$/) do
  create_user
end

When(/^I sign in with valid credentials$/) do
  sign_in
end

When(/^I sign in with invalid credentials$/) do
  set_invalid_user_credentials
  sign_in
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end