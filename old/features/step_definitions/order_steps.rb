def create_customer
  tmp = {
    full_name:  "Dr John Doe",
    company:    "Doe & Associates",
    address1:   "Apartment 12 Building 4",
    address2:   "123 XYZ Avenue",
    postcode:   "ABC123",
    city:       "QWE City",
    country:    "MyCountry",
    notes:      "Please call the following number when downstairs: +123456789.",
    telephone:  "+987654321",
    email:      "j.doe@doe.com"
  }
  
  @customer = FactoryGirl.create(:customer, tmp)
end

def create_order
  create_instruction if @instruction.nil?
  
  create_customer
  
  tmp = {
    instruction: @instruction,
    customer: @customer,
    reviewed: true,
    code: SecureRandom.hex(4),
    status: :new_order
  }
  @order = FactoryGirl.create(:order, tmp)
end

Given(/^an order exists$/) do
  create_order
end

Given(/^a set of orders exist$/) do
  (1..5).each do |i|
    create_order
  end  
end

Given(/^the order has been processed$/) do
  @order.update_attributes(status: :processed)
end

Given(/^the order has not been processed$/) do
  #@order.update_attributes(status: :new_order)
end

When(/^I click on the order button$/) do
  click_link I18n.t('keywords.order'),  href: new_instruction_order_path(@instruction)
end

When(/^I create a new order$/) do
  visit new_instruction_order_path(@instruction)
  fill_in 'order_customer_attributes_full_name' , with: 'Dr. John Doe'
  fill_in 'order_customer_attributes_company'   , with: 'Doe GmbH'
  fill_in 'order_customer_attributes_address1'  , with: '123 Orange Drive'
  fill_in 'order_customer_attributes_address2'  , with: ''
  fill_in 'order_customer_attributes_postcode'  , with: 'ABC123'
  fill_in 'order_customer_attributes_city'      , with: 'Orangeville'
  select 'France',  from: 'order_customer_attributes_country'
  fill_in 'order_customer_attributes_notes'     , with: 'Please knock on the back door.'
  fill_in 'order_customer_attributes_telephone' , with: '+1234567890'
  fill_in 'order_customer_attributes_email'     , with: 'j.doe@doe.com'
  click_button 'Create Order'
end

When(/^I confirm the order$/) do
  click_link 'Confirm Order'
end

When(/^I visit the order page with a valid code$/) do
  visit order_path(@order, code: @order.code)
end

When(/^I visit the order page with a invalid code$/) do
  visit order_path(@order, code: SecureRandom.hex(2))
end

When(/^I visit the order$/) do
  visit order_path(@order)
end

When(/^I visit the order edit page$/) do
  visit edit_order_path(@order)
end

When(/^I cancel the order$/) do
  visit order_path(@order, code: @order.code)
  click_link I18n.t('keywords.cancel')
end

Then(/^I should see the NEW order page$/) do
  expect(page).to have_field 'order_customer_attributes_full_name'
  expect(page).to have_field 'order_customer_attributes_company'
  expect(page).to have_field 'order_customer_attributes_address1'
  expect(page).to have_field 'order_customer_attributes_address2'
  expect(page).to have_field 'order_customer_attributes_postcode'
  expect(page).to have_field 'order_customer_attributes_city'
  expect(page).to have_field 'order_customer_attributes_country'
  expect(page).to have_field 'order_customer_attributes_notes'
  expect(page).to have_field 'order_customer_attributes_telephone'
  expect(page).to have_field 'order_customer_attributes_email'
end

Then(/^I should see a order successfully created message$/) do
  expect(page).to have_content I18n.t('orders.reviewed.success')
end

Then(/^I should see the order details$/) do
  expect(page).to have_content @order.token
  expect(page).to have_content @order.customer.full_name
  expect(page).to have_content @order.customer.company
  expect(page).to have_content @order.customer.address1
  expect(page).to have_content @order.customer.address2
  expect(page).to have_content @order.customer.postcode
  expect(page).to have_content @order.customer.city
  expect(page).to have_content @order.customer.country
  expect(page).to have_content @order.customer.notes
  expect(page).to have_content @order.customer.telephone
  expect(page).to have_content @order.customer.email
  expect(page).to have_content @order.instruction.language.name
  expect(page).to have_content @order.instruction.product.name
  expect(page).to have_content @order.created_at
  
  if @order.status == 'new order'
    expect(page).to have_link  I18n.t("keywords.cancel")
  end
  
end

Then(/^I should see a order code invalid message$/) do
  expect(page).to have_content I18n.t('orders.invalid_code')
end

Then(/^I should see the set of orders$/) do
  visit company_path(@user.company)
  @user.company.orders.each do |o|
    expect(page).to have_content o.token
    expect(page).to have_content o.created_at
  end
end

Then(/^I should see the edit order button$/) do
  expect(page).to have_link I18n.t("keywords.edit"), href: edit_order_path(@order)
end

Then(/^I should not see the edit order button$/) do
  expect(page).to_not have_link I18n.t("keywords.edit"), href: edit_order_path(@order)
end

Then(/^I should see a order already processed message$/) do
  expect(page).to have_content I18n.t('orders.already_processed')
end

Then(/^I should see the visitor edit order fields$/) do
  expect(page).to have_field 'order_customer_attributes_full_name'
  expect(page).to have_field 'order_customer_attributes_company'
  expect(page).to have_field 'order_customer_attributes_address1'
  expect(page).to have_field 'order_customer_attributes_address2'
  expect(page).to have_field 'order_customer_attributes_postcode'
  expect(page).to have_field 'order_customer_attributes_city'
  expect(page).to have_field 'order_customer_attributes_country'
  expect(page).to have_field 'order_customer_attributes_notes'
  expect(page).to have_field 'order_customer_attributes_telephone'
  expect(page).to have_field 'order_customer_attributes_email'
end

Then(/^I should see a order cancelled message$/) do
  expect(page).to have_content I18n.t('orders.cancelled')
end

Then(/^I should see the user edit order fields$/) do
  expect(page).to have_field 'order_status'
  save_and_open_page
end