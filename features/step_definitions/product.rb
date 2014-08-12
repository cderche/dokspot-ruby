Given(/^the company has a product$/) do
  create_product_for @company
end

Given(/^the product is published$/) do
  @product.update_attributes(published: true)
end

Given(/^the product is unpublished$/) do
  @product.update_attributes(published: false)
end

When(/^I visit the product page$/) do
  visit product_path(@product)
end

When(/^I visit the new product page$/) do
  visit new_company_product_path(@company)
end

When(/^I fill in the product details$/) do
  fill_in 'product[name]', with: 'example product'
end

When(/^I visit the product edit page$/) do
  visit edit_product_path(@product)
end

When(/^I try to destroy the product$/) do
  page.driver.submit :delete, product_path(@product), {}
end

Then(/^I should see the product details$/) do
  expect(page).to have_content @product.name
  expect(page).to have_content @product.uuid
  expect(page).to have_content @product.company.name
end

Given(/^a set of instructions exist for the product$/) do
  create_instruction_set_for_product
end

Then(/^I should see the product instruction language name$/) do
  @product.instructions.each do |instruction|
    expect(page).to have_content instruction.language.name
  end
end