When(/^I create a company with valid data$/) do
  new_company
  fill_in_company_form
end

When(/^I create an existing company$/) do
  create_company
  fill_in_company_form
end

When(/^I create a incomplete company$/) do
  new_company
  remove_contact
  fill_in_company_form  
end