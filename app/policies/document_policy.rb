class DocumentPolicy
  
  attr_reader :current_user, :document
  
  def initialize(current_user, document)
    @current_user = current_user
    @document = document
  end
  
  def index?
    return true if @current_user.nil?
    @current_user.admin? or @current_user.company == @document.instruction.product.company
  end

  #def show?
    #true#@current_user.admin? or @current_user.company == @company
  #end
  
  def new?
    create?
  end
  
  def edit?
    update?
  end
  
  def create?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @document.instruction.product.company
  end

  def update?
    return false if @current_user.nil?
    @current_user.admin? or @current_user.company == @document.instruction.product.company
  end

  def destroy?
    return false if @current_user.nil?
    return true if @current_user.company == @document.instruction.product.company and !@document.primary?
    @current_user.admin? and !@document.primary?
  end
  
  def primary?
    download?
  end
  
  def download?
    return true if @current_user.nil? and (@document.instruction.published? and @document.instruction.product.published?)
    return true if @current_user.company == @document.instruction.product.company
    @current_user.admin?
  end
  
  def make_primary?
    update?
  end
  
end
