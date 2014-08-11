When(/^I create a product with valid data$/) do
  new_product
  product_form
end

When(/^I create an existing product$/) do
  create_company_and_product
  product_form
end

When(/^I create a product with incomplete data$/) do
  new_product
  remove_product_name
  product_form
end