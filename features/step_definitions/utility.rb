When(/^I click on "(.*?)"$/) do |arg1|
  click_on arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  expect(page).to have_content arg1
end

Then(/^I should see a "(.*?)" link$/) do |arg1|
  expect(page).to have_link(arg1)
  #find_link(arg1).visible?
end

Then(/^I should not see a "(.*?)" link$/) do |arg1|
  #find_link(arg1).visible? == false
  expect(page).to_not have_link(arg1)
end

Given(/^there is a set of languages$/) do
  FactoryGirl.create(:language, { name: 'Bulgarian' })
  FactoryGirl.create(:language, { name: 'Croatian' })
  FactoryGirl.create(:language, { name: 'Czech' })
end