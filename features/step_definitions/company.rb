Given(/^a set of companies exist$/) do
  create_company_set
end

Given(/^I have a company$/) do
  create_company
  set_user_company
end

Given(/^there is my company$/) do
  create_company
  set_user_company if !@user.nil?
end

Given(/^there is a company$/) do
  create_company
end

Given(/^a set of users exist for the company$/) do
  create_user_set_for_company
end

Given(/^a set of products exist for the company$/) do
  create_product_set_for_company
end

When(/^I visit the companies index page$/) do
  visit companies_path
end

When(/^I visit the company page$/) do
  visit company_path(@company)
end

When(/^I visit my company edit page$/) do
  visit edit_company_path(@user.company)
end

When(/^I visit the company edit page$/) do
  visit edit_company_path(@company)
end

When(/^I submit the edit company form$/) do
  new_company
  change_new_company
  fill_in_company_form
  click_on 'Update Company'
end

When(/^I visit the create company page$/) do
  visit new_company_path
end

When(/^I submit the create company form$/) do
  new_company
  fill_in_company_form
  click_on 'Create Company'
end

When(/^I try to destroy the company$/) do
  page.driver.submit :delete, company_path(@company), {}
end

Then(/^I should see the set of companies$/) do
  Company.all.each do |company|
    expect(page).to have_content company.name
  end
end

Then(/^I should see the company details$/) do
  expect(page).to have_content @company.name
  expect(page).to have_content @company.symbol
  expect(page).to have_content @company.website
  expect(page).to have_content @company.contact
  expect(page).to have_content @company.order_email
end

Then(/^I should see the company user emails$/) do
  @company.users.each do |user|
    expect(page).to have_content user.email
  end
end

Then(/^I should not see the company user emails$/) do
  @company.users.each do |user|
    expect(page).to_not have_content user.email
  end
end

Then(/^I should see the company product names$/) do
  @company.products.each do |product|
    expect(page).to have_content product.name
  end
end

Then(/^I should not see the company product names$/) do
  @company.products.each do |product|
    expect(page).to_not have_content product.name
  end
end