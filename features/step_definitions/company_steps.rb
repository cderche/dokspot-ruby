### UTILITY ###

def new_company
  @new_company ||= {
    name: "Example Company",
    symbol: "EX",
    website: "http://www.example.com",
    contact: "contact@example.com",
    order_email: "order@example.com"
  }
end

def create_company
  new_company
  delete_company
  @company = FactoryGirl.create(:company, @new_company)
end

def delete_company
  @company ||= Company.where(:name => @new_company[:name]).first
  @company.destroy unless @company.nil?
end

### GIVEN ###

Given(/^a set of companies exists$/) do
  (1..5).each do |i|
    tmp ||= {
      name:         "example#{i}",
      symbol:       "ex#{i}",
      website:      "www.example#{i}.com",
      contact:      "contact@example#{i}.com",
      order_email:  "order@example#{i}.com"
    }
    FactoryGirl.create(:company, tmp)
  end
end

Given(/^a set of users exists for the company$/) do
  (1..5).each do |i|
    role = :operator
    role = :manager if i.even?
    tmp ||= {
      email:                  "ex#{i}@example.com",
      password:               "changeme",
      password_confirmation:  "changeme",
      company:                @company,
      role:                   role
    }
    FactoryGirl.create(:user, tmp)
  end
end

Given(/^there is a company$/) do
  create_company
end

Given(/^there is my company$/) do
  @company = @user.company
end

### WHEN ###

When(/^I visit the company page$/) do
  create_company if @company.nil?
  visit company_path(@company)
end

When(/^I visit the companies index page$/) do
  visit companies_path
end

When(/^I click on the EDIT company button$/) do
  click_link I18n.t('edit.company'),  href: edit_company_path(@company)
end

When(/^I visit the company edit page$/) do
  create_company if @company.nil?
  visit edit_company_path(@company)
end

When(/^I edit the company$/) do
  visit edit_company_path(@company)
  fill_in 'company_contact', with: 'john.doe@example.com'
  click_on 'Update Company'
end

When(/^I click on the DELETE company button$/) do
  click_link I18n.t('delete.company'),  href: company_path(@company)
end

When(/^I click on the new company button$/) do
  visit companies_path
  click_link I18n.t('new.company'),  href: new_company_path
end

When(/^I create a company$/) do
  visit new_company_path
  fill_in 'company_name'        , with: 'example corp'
  fill_in 'company_symbol'      , with: 'EXC'
  fill_in 'company_website'     , with: 'http://www.excorp.com'
  fill_in 'company_contact'     , with: 'contact@excorp.com'
  fill_in 'company_order_email' , with: 'order@excorp.com'
  click_button 'Create Company'
end

### THEN ###

Then(/^I should see information on each company$/) do
  Company.all.each do |company|
    expect(page).to have_content  company.name
    expect(page).to have_content  company.symbol
    expect(page).to have_link     company.website,  href: company.website
    expect(page).to have_link     I18n.t('show.company'),   href: company_path(company)
  end
end

Then(/^I should see a button for add a new company$/) do
  expect(page).to have_link I18n.t('new.company'),  href: new_company_path
end

Then(/^I should see the company details$/) do
  expect(page).to have_content  @company.name
  expect(page).to have_content  @company.symbol
  expect(page).to have_content  @company.contact
  expect(page).to have_content  @company.order_email
  expect(page).to have_link     @company.website,   href: @company.website
end

Then(/^I should see the EDIT company button$/) do
  expect(page).to have_link I18n.t('edit.company'),  href: edit_company_path(@company)
end

Then(/^I should see the DELETE company button$/) do
  expect(page).to have_link I18n.t('delete.company'),  href: company_path(@company)
end

Then(/^I should not see the EDIT company button$/) do
  expect(page).to_not have_link I18n.t('edit.company'),  href: edit_company_path(@company)
end

Then(/^I should not see the DELETE company button$/) do
  expect(page).to_not have_link I18n.t('delete.company'),  href: company_path(@company)
end

Then(/^I should see the EDIT company page$/) do
  expect(page).to have_content "Editing #{@company.name}"
end

Then(/^I should see the EDIT company fields$/) do
  find_field  'company_name'    if @user.admin?
  find_field  'company_symbol'  if @user.admin?
  find_field  'company_website'
  find_field  'company_contact'
  find_field  'company_order_email'
end

Then(/^I should see a company successfully edited message$/) do
  expect(page).to have_content I18n.t('companies.updated')
end

Then(/^I should see the company successfully deleted message$/) do
  expect(page).to have_content I18n.t('companies.destroy.success')  
end

Then(/^I should see the new company page$/) do
  expect(page).to have_content 'New company'
  find_field 'company_name'
  find_field 'company_symbol'
  find_field 'company_website'
  find_field 'company_contact'
  find_field 'company_order_email'
end

Then(/^I should see a company successfully created message$/) do
  expect(page).to have_content I18n.t('companies.success')
end