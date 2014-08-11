class ProductPolicy
  
  attr_reader :current_user, :product
  
  def initialize(current_user, product)
    @current_user = current_user
    @product = product
  end
  
  def index?
    @current_user.admin?
  end

  def show?
    #@current_user.admin? or @current_user.company == @company
  end
  
  def new?
    create?
  end
  
  def edit?
    update?
  end
  
  def create?
    @current_user.admin? or @current_user.company == @product.company
  end

  def update?
    @current_user.admin? or @current_user.company == @product.company
  end

  def destroy?
    return true if @current_user.company == @product.company
    @current_user.admin?
  end
  
end
