class ProductPolicy
  
  attr_reader :current_user, :product
  
  def initialize(current_user, product)
    @current_user = current_user
    @product = product
  end

  def show?
    return @product.published? if @current_user.nil?
    @current_user.admin? or @current_user.company == @product.company
  end
  
  def new?
    create?
  end
  
  def edit?
    update?
  end
  
  def create?
    return true if @current_user.company == @product.company
    @current_user.admin?
  end

  def update?
    return false if @current_user.nil?
    return true if @current_user.company == @product.company
    @current_user.admin?
  end

  def destroy?
    return false if @current_user.nil?
    return true if @current_user.company == @product.company
    @current_user.admin?
  end
  
  def search?
    show?
  end
  
  def download_qrcode?
    return false if @current_user.nil?
    return true if @current_user.company == @product.company
    @current_user.admin?
  end
end
