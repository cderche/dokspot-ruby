Given(/^a set of companies exist$/) do
  create_company_set
end

When(/^I go to the company index$/) do
  visit companies_path
end

Then(/^I should see the set of companies$/) do
  Company.all.each do |company|
    expect(page).to have_content company.name
  end
end

When(/^I visit a company$/) do
  create_company
  visit company_path(@company)
end

Then(/^I should see the company details$/) do
  expect(page).to have_content @company.name
  expect(page).to have_content @company.symbol
  expect(page).to have_content @company.website
  expect(page).to have_content @company.contact
  expect(page).to have_content @company.order_email
end

When(/^I edit a company$/) do
  create_company
  visit edit_company_path(@company)
  fill_in 'company[website]', with: 'www.other.com'
  click_on 'Update Company'
end

When(/^I destroy a company$/) do
  create_company
  visit company_path(@company)
  click_link 'Destroy'
end