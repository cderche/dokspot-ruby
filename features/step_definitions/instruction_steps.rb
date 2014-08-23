def create_instruction
  language = FactoryGirl.create(:language, { name: 'English' })
  tmp = {
    language: language,
    product:  @product
  }
  @instruction = FactoryGirl.create(:instruction, tmp)
end

def create_languages
  FactoryGirl.create(:language, { name: 'French'  })
  FactoryGirl.create(:language, { name: 'English' })
  FactoryGirl.create(:language, { name: 'Germany' })
  FactoryGirl.create(:language, { name: 'Spanish' })
  FactoryGirl.create(:language, { name: 'Greek'   })
end

### GIVEN ###

Given(/^there is a set of instructions for a published product belonging to a company$/) do
  create_company
  create_product
  
  @product.update_attributes(published: true)
  
  create_languages
  
  Language.all.each do |lang|
    
    published = true if lang.id.even? # Assign whether the instructions are published or not (for test)
    published = false if lang.id.odd? #
    
    tmp ||= {
      language:   lang,
      product:    @product,
      published:  published
    }
    FactoryGirl.create(:instruction, tmp)
  end  
end

Given(/^there is a set of instructions for a published product belonging to my company$/) do
  create_product
  
  @product.update_attributes(published: true)
  
  create_languages
  
  Language.all.each do |lang|
    
    published = true if lang.id.even? # Assign whether the instructions are published or not (for test)
    published = false if lang.id.odd? #
    
    tmp ||= {
      language:   lang,
      product:    @product,
      published:  published
    }
    FactoryGirl.create(:instruction, tmp)
  end
end

Given(/^there is a set of instructions for a unpublished product belonging to a company$/) do
  create_company
  create_product
  
  @product.update_attributes(published: false)
  
  create_languages
  
  Language.all.each do |lang|
    
    published = true if lang.id.even? # Assign whether the instructions are published or not (for test)
    published = false if lang.id.odd? #
    
    tmp ||= {
      language:   lang,
      product:    @product,
      published:  published
    }
    FactoryGirl.create(:instruction, tmp)
  end  
end

Given(/^there is a set of instructions for a unpublished product belonging to my company$/) do
  create_product
  
  @product.update_attributes(published: false)
  
  create_languages
  
  Language.all.each do |lang|
    
    published = true if lang.id.even? # Assign whether the instructions are published or not (for test)
    published = false if lang.id.odd? #
    
    tmp ||= {
      language:   lang,
      product:    @product,
      published:  published
    }
    FactoryGirl.create(:instruction, tmp)
  end
end

Given(/^there is a "(.*?)" product belonging to "(.*?)" company has a "(.*?)" instruction$/) do |arg1, arg2, arg3|
  
  if arg1 == "published"
    p_pub = true
  else
    p_pub = false
  end
  
  if arg2 == "a"
    create_company
  end
  
  if arg3 == "published"
    i_pub = true
  else
    i_pub = false
  end
  
  create_product
  @product.update_attributes(published: p_pub)
  create_instruction
  @instruction.update_attributes(published: i_pub)
end


### WHEN ###

When(/^I visit the instruction page$/) do
  visit instruction_path(@instruction)
end

When(/^I click on the EDIT instruction button$/) do
  click_link I18n.t('edit.instruction'),  href: edit_instruction_path(@instruction)
end

When(/^I visit the instruction EDIT page$/) do
  visit edit_instruction_path(@instruction)
end

When(/^I EDIT the instruction$/) do
  language = FactoryGirl.create(:language, { name: 'French' })  
  visit edit_instruction_path(@instruction)
  select 'French', from: 'instruction_language_id'
  click_button 'Update Instruction'
end

### THEN ###

Then(/^I should see ALL instructions$/) do
  @product.instructions.each do |instruction|
    expect(page).to have_content instruction.language.name
    expect(page).to have_link     I18n.t('instructions.primary'), href: instruction_primary_path(instruction)
    expect(page).to have_link     I18n.t('instructions.history'), href: instruction_path(instruction)
  end
end

Then(/^I should see PUBLISHED instructions$/) do
  @product.instructions.each do |instruction|
    if instruction.published?
      expect(page).to have_content  instruction.language.name
      expect(page).to have_link     I18n.t('instructions.primary'), href: instruction_primary_path(instruction)
      expect(page).to have_link     I18n.t('instructions.history'), href: instruction_path(instruction)
    else
      expect(page).to_not have_content instruction.language.name
      expect(page).to_not have_link     I18n.t('instructions.primary'), href: instruction_primary_path(instruction)
      expect(page).to_not have_link     I18n.t('instructions.history'), href: instruction_path(instruction)
    end
  end
end

Then(/^I should see the instruction details$/) do
  #save_and_open_page
  expect(page).to have_content  @instruction.language.name
  expect(page).to have_content  @instruction.product.name
end

Then(/^I should see the EDIT instruction button$/) do
  expect(page).to have_link I18n.t('edit.instruction'), edit_instruction_path(@instruction)
end

Then(/^I should see the DELETE instruction button$/) do
  expect(page).to have_link I18n.t('delete.instruction'), instruction_path(@instruction)
end

Then(/^I should see the EDIT instruction page$/) do
  expect(page).to have_content "Editing #{@instruction.language.name} Instructions"
end

Then(/^I should see the EDIT instruction fields$/) do
  find_field 'instruction_language_id'
end

Then(/^I should see a instruction successfully edited message$/) do
  expect(page).to have_content I18n.t('instructions.update.success')
end