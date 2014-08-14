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

### BUTTONS ###

Then(/^I should see a New Company link$/) do
  expect(page).to have_link I18n.t('new'), new_company_path
end

Then(/^I should see a Edit Company link$/) do
  expect(page).to have_link I18n.t('edit'), edit_company_path(@company)
end

Then(/^I should see a Delete Company link$/) do
  expect(page).to have_link I18n.t('delete'), company_path(@company)
end

Then(/^I should see a Back link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a New Product link$/) do
  expect(page).to have_link I18n.t('new'), new_company_product_path(@company)
end

Then(/^I should see a New User link$/) do
  expect(page).to have_link I18n.t('new'), new_user_invitation_path
end