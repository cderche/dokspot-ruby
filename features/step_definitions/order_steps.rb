When(/^I click on the order button$/) do
  click_button I18n.t('keywords.order'),  href: new_instruction_order_path(@instruction)
end