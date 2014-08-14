class NotificationPolicy
  
  attr_reader :current_user, :notification
  
  def initialize(current_user, notification)
    @current_user = current_user
    @notification = notification
  end
  
  def display?
    @current_user.nil?
  end
  
  def index?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @notification.product.company
  end

  def show?
    @current_user.admin? or @current_user.company == @notification.product.company
  end
  
  def new?
    create?
  end
  
  def edit?
    update?
  end
  
  def create?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @notification.product.company
  end

  def update?
    @current_user.admin? or @current_user.company == @notification.product.company
  end

  def destroy?
    return true if @current_user.company == @notification.product.company
    @current_user.admin?
  end
  
end
