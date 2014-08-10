Given(/^I am an admin$/) do
  set_role :admin
end

Given(/^I am a manager$/) do
  set_role :manager
end

Given(/^I am an operator$/) do
  set_role :operator
end