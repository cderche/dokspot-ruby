class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  #def index?
  #  @current_user.admin?
  #end

  def show?
    @current_user.admin? or @current_user.company == @user.company
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_user == @user
    return true if @current_user.manager? and @current_user.company == @user.company
    @current_user.admin?
  end

end