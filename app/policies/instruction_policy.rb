class InstructionPolicy
  
  attr_reader :current_user, :instruction
  
  def initialize(current_user, instruction)
    @current_user = current_user
    @instruction = instruction
  end
  
  #def index?
  #  @current_user.admin?
  #end

  def show?
    #@current_user.admin? or @current_user.company == @company
  end
  
  def new?
    #@current_user.nil?
    create?
  end
  
  def edit?
    update?
  end
  
  def create?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @instruction.product.company
  end

  def update?
    @current_user.admin? or @current_user.company == @instruction.product.company
  end

  def destroy?
    return true if @current_user.company == @instruction.product.company
    @current_user.admin?
  end
  
end
