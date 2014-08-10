Given(/^I am logged in$/) do
  create_user
  sign_in
end

When(/^I invite a colleague with the email "(.*?)"$/) do |arg1|
	create_colleague arg1
  invite
end