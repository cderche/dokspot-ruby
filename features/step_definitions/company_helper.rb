def new_company
  @new_company ||= {
    name:         "example",
    symbol:       "ex",
    website:      "www.example.com",
    contact:      "contact@example.com",
    order_email:  "order@example.com"
  }
end

def create_company
  new_company
  delete_company
  @company = FactoryGirl.create(:company, @new_company)
end

def fill_in_company_form
  visit new_company_path
  fill_in 'company[name]'       , with: @new_company[:name]
  fill_in 'company[symbol]'     , with: @new_company[:symbol]
  fill_in 'company[website]'    , with: @new_company[:website]
  fill_in 'company[contact]'    , with: @new_company[:contact]
  fill_in 'company[order_email]', with: @new_company[:order_email]
  click_on 'Create Company'
end

def delete_company
  @company ||= Company.where(:name => @new_company[:name]).first
  @company.destroy unless @company.nil?
end

def remove_contact
  @new_company = @new_company.merge(contact: "")
end

def create_company_set
  (1..5).each do |i|
    tmp ||= {
      name:         "example#{i}",
      symbol:       "ex#{i}",
      website:      "www.example#{i}.com",
      contact:      "contact@example#{i}.com",
      order_email:  "order@example#{i}.com"
    }
    FactoryGirl.create(:company, tmp)
  end
end