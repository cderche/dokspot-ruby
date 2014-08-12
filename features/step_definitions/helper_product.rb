def new_product
  @new_product ||= {
    name: "example product"
  }
end

def create_product
  new_product
  delete_product
  @product = FactoryGirl.create(:product, @new_product)
end

def delete_product
  @product ||= Product.where(name: @new_product[:name]).first
  @product.destroy unless @product.nil?
end

def product_form
  visit new_product_path
  fill_in 'product[name]', with: @new_product[:name]
  
  if @user.admin?
    select Company.first.name, from: 'product[company_id]'
  end
  
  click_on 'Create Product'
end

def remove_product_name
  @new_product = @new_product.merge(name: "")
end


def create_company_product_set
  (1..5).each do |i|
    tmp ||= {
      name: "example product #{i}",
      company: @company
    }
    FactoryGirl.create(:product, tmp)
  end
end

def create_product_for company
  new_product
  @new_product = @new_product.merge(company: @company)
  delete_product
  @product = FactoryGirl.create(:product, @new_product)
end

def create_instruction_set_for_product
  Language.all.each do |language|
    instruction = {
      language: language,
      product: @product
    }
    FactoryGirl.create(:instruction, instruction)
  end
end