class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  
  def edit?
    @current_user == @user
  end

  def update?
    return true if @current_user.admin?
    @current_user.manager? and @user.operator? and @user.company == @current_user.company
  end

  def destroy?
    return false  if @current_user == @user
    return true   if @current_user.admin?
    @current_user.manager? and @user.operator? and @user.company == @current_user.company
  end

end