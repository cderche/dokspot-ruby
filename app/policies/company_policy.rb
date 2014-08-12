class CompanyPolicy
  attr_reader :current_user, :company
  
  def initialize(current_user, company)
    @current_user = current_user
    @company = company
  end
  
  def index?
    @current_user.admin?
  end

  def show?
    return true if @current_user.admin?
    @current_user.company == @company
  end
  
  def new?
    create?
  end
  
  def edit?
    update?
  end
  
  def create?
    @current_user.admin?
  end

  def update?
    return true if @current_user.admin?
    @current_user.company == @company and @current_user.manager?
  end

  def destroy?
    return false if @current_user.company == @company
    @current_user.admin?
  end
  
end