class InstructionPolicy
  
  attr_reader :current_user, :instruction
  
  def initialize(current_user, instruction)
    @current_user = current_user
    @instruction = instruction
  end
  
  def index?
    return true if @current_user.nil?
    @current_user.admin? or current_user.company == @instruction.product.company
  end

  def show?
    return (@instruction.published? and @instruction.product.published?) if @current_user.nil?
    @current_user.admin? or @current_user.company == @instruction.product.company
  end
  
  def new?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.manager? or current_user.operator?
  end
  
  def edit?
    update?
  end
  
  def create?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @instruction.product.company
  end

  def update?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @instruction.product.company
  end

  def destroy?
    return false if @current_user.nil?
    return true if @current_user.company == @instruction.product.company
    @current_user.admin?
  end
  
  def primary?
    show?
  end
  
end
