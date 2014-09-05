def create_document

  src = File.join(Rails.root.join('spec', 'support', 'example.pdf'))

  doc ||= {
    instruction: @instruction,
    primary: true,
    file: File.new(src),
    primary: true
  }
  @document = FactoryGirl.create(:document, doc)
end

def document_valid document
  expect(page).to have_content document.version
    expect(page).to have_link I18n.t('documents.download'), href: document_download_path(document)
    
    if @user.nil?
      expect(page).to_not have_link I18n.t('delete.document'), href: document_path(document)
    elsif @user.manager? or @user.operator?
      if @user.company == @instruction.product.company
        expect(page).to have_link I18n.t('delete.document'), href: document_path(document) if !document.primary
      else
        expect(page).to_not have_link I18n.t('delete.document'), href: document_path(document)
      end
    elsif @user.admin?
      expect(page).to have_link I18n.t('delete.document'), href: document_path(document) if !document.primary
    end
  end

### GIVEN ###

Given(/^there is a set of documents for the instruction$/) do
  src = File.join(Rails.root.join('spec', 'support', 'example.pdf'))
  
  (1..5).each do |i|
    tmp ||= {
      instruction: @instruction,
      version: i,
      file: File.new(src),
      primary: false
    }
    tmp = tmp.merge(primary: true) if tmp[:version] == 5
    
    FactoryGirl.create(:document, tmp)
  end
end

Given(/^the instruction has a document$/) do
  create_document
end

### WHEN ###

When(/^I click the PRIMARY button$/) do
  click_link I18n.t('instructions.primary'), href: instruction_primary_path(@instruction)
end


When(/^I click on the DELETE document button$/) do
  document = @instruction.documents.nonprimary.first
  click_link I18n.t('keywords.delete'), href: document_path(document)
end

When(/^I click on the NEW document button$/) do
  visit instruction_path(@instruction)
  click_link I18n.t('new.document'), href: new_instruction_document_path(@instruction)
end

When(/^I create a document$/) do
  visit new_instruction_document_path(@instruction)
  fill_in 'document_version', with: '1.0'
  attach_file('document_file', Rails.root.join('spec', 'support', 'example.pdf'))
  click_button 'Create Document'
end

### THEN ###

Then(/^I should see ALL documents$/) do
  @instruction.documents.primary.each do |document|
    document_valid document
  end
  @instruction.documents.nonprimary.each do |document|
    document_valid document
  end
end

Then(/^I should see the document successfully deleted message$/) do
  expect(page).to have_content I18n.t('documents.destroy.success')
end

Then(/^I should see the NEW document page$/) do
  expect(page).to have_content I18n.t('new.document')
  #find_field 'document_comment'
  find_field 'document_version'
  find_field 'document_file'
end

Then(/^I should see a document successfully created message$/) do
  expect(page).to have_content I18n.t('documents.create.success')
end

Then(/^I should download the document$/) do
  expect(page.driver.response.headers['Content-Type']).to include("application/pdf")
  expect(page.driver.response.headers['Content-Disposition']).to include("filename=\"#{@document.fileName}\"")
  #assert_match 'application/pdf', page.response_headers['Content-Type']
end
