Given(/^I have a company with a product$/) do
  create_company_and_product
  create_product_for_company
end

When(/^I create a new instruction with valid data$/) do
  visit new_instruction_path
  
end