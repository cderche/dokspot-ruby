class CustomerPolicy
  attr_reader :current_user, :customer
  
  def initialize(current_user, customer)
    puts "DOES THIS WORK"
    @current_user = current_user
    @customer = customer
  end
  
  def contact?
    puts 'contact policy review'
    true
  end
  
  def callback?
    puts 'callback policy review'
    true
  end
  
  def close?
    return @current_user.admin?
  end
  
end