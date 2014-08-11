Given(/^the company has a set of products$/) do
  create_company_product_set
end

Then(/^I should see the company products$/) do
  @company.products.all.each do |product|
    expect(page).to have_content product.name
  end
end

Given(/^there exists a product$/) do
  create_company_and_product
end

When(/^I visit that product$/) do
  visit product_path(@product)
end

Then(/^I should see the product details$/) do
  expect(page).to have_content @product.name
  expect(page).to have_content @product.uuid
  expect(page).to have_content @product.published
  expect(page).to have_content @product.company.name
end

When(/^I edit one of the company products$/) do
  visit edit_product_path(@company.products.first)
  fill_in 'product[name]', with: 'other name'
  click_on 'Update Product'
end

When(/^I destroy one of the company products$/) do
  visit product_path(@company.products.first)
  click_link 'Destroy'
end