class OrderPolicy
  attr_reader :current_user, :order
  
  def initialize(current_user, order)
    @current_user = current_user
    @order = order
  end
  
  def index?
    true
  end

  def show?
    @current_user.nil? or @current_user.company == @order.instruction.product.company or @current_user.admin?
  end
  
  def new?
    true
  end
  
  def edit?
    if @current_user.nil?
      puts "I'm a visitor"
      puts "Status: #{@order.status}"
      if @order.status == "new_order"
        puts "New Order"
        return true
      else
        puts "Processed"
        return false
      end
    else
      puts "I'm a user"
      return true if @current_user.admin? && @order.status != 'cancelled'
      puts "It's my order"
      @current_user.company == @order.instruction.product.company && @order.status != 'cancelled'
    end
  end
  
  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
  
  def cancel?
    @current_user.nil? && @order.reviewed && @order.status == 'new_order'
  end
  
end