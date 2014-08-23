def new_product
  @new_product ||= {
    name:     "Example Product",
    company:  @company
  }
end

def create_product
  new_product
  @product = FactoryGirl.create(:product, @new_product)
end

### GIVEN ###

Given(/^a set of products exist$/) do
  (1..5).each do |i|
    tmp ||= {
      name:     "example#{i}",
      company:  @company
    }
    FactoryGirl.create(:product, tmp)
  end  
end

Given(/^there is a company with a published product$/) do
  create_company
  create_product
  @product.update_attributes(published: true)
end

Given(/^there is a company with a unpublished product$/) do
  create_company
  create_product
  @product.update_attributes(published: false)
end

Given(/^there is my company with a published product$/) do
  create_product
  @product.update_attributes(published: true)
end


Given(/^there is my company with a unpublished product$/) do
  create_product
  @product.update_attributes(published: false)
end

### WHEN ###

When(/^I visit the product page$/) do
  visit product_path(@product)
end

When(/^I click on the EDIT product button$/) do
  click_link I18n.t('edit.product'),  href: edit_product_path(@product)
end

When(/^I visit the product EDIT page$/) do
  visit edit_product_path(@product)
end

When(/^I EDIT the product$/) do
  visit edit_product_path(@product)
  fill_in 'product_name', with: 'random product'
  check 'product_published' if @user.admin? or @user.manager?
  #click_button I18n.t('edit.product')
  click_button "Update Product"
end

When(/^I click on the DELETE product button$/) do
  click_link I18n.t('delete.product'),  href: product_path(@product)
end

When(/^I click on the NEW product button$/) do
  visit company_path(@company)
  click_link I18n.t('new.product'),  href: new_company_product_path(@company)
end

When(/^I create a product$/) do
  visit new_company_product_path(@company)
  fill_in 'product_name', with: 'Product XYZ'
  click_button "Create Product"
end

### THEN ###

Then(/^I should see information about each product$/) do
  @company.products.all.each do |product|
    expect(page).to have_content  product.name
    expect(page).to have_content  product.uuid
    expect(page).to have_link     I18n.t('show.product'), href: product_path(product)
  end
end

Then(/^I should see the NEW product button$/) do
  expect(page).to have_link I18n.t('new.product'), href: new_company_product_path(@company)
end

Then(/^I should see the product details$/) do
  expect(page).to have_content  @product.name
  expect(page).to have_content  @product.uuid
end

Then(/^I should see the EDIT product button$/) do
  expect(page).to have_link I18n.t('edit.product'), href: edit_product_path(@product)
end

Then(/^I should see the DELETE product button$/) do
  expect(page).to have_link I18n.t('delete.product'), href: product_path(@product)
end

Then(/^I should not see the EDIT product button$/) do
  expect(page).to_not have_link I18n.t('edit.product'), href: edit_product_path(@product)
end

Then(/^I should not see the DELETE product button$/) do
  expect(page).to_not have_link I18n.t('delete.product'), href: product_path(@product)
end

Then(/^I should see the EDIT product page$/) do
  expect(page).to have_content "Editing #{@product.name}"
end

Then(/^I should see the EDIT product fields$/) do
  find_field 'product_name'
  find_field 'product_published' if @user.admin? or @user.manager?
  find_field 'product_company_id' if @user.admin?
end

Then(/^I should see a product successfully edited message$/) do
  expect(page).to have_content I18n.t('products.update.success')
end

Then(/^I should see the product successfully deleted message$/) do
  expect(page).to have_content I18n.t('products.destroy.success')
end

Then(/^I should see the NEW product page$/) do
  expect(page).to have_content 'New product'
  find_field 'product_name'
  find_field 'product_published' if @user.admin? or @user.manager?
  find_field 'product_company_id' if @user.admin?
end

Then(/^I should see a product successfully created message$/) do
  expect(page).to have_content I18n.t('products.create.success')
end
