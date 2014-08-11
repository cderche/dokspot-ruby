module ProductsHelper

  def set_company
    if @product.company.blank?
      @product.company = current_user.company
    end
  end

end
