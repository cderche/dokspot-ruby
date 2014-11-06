class CustomerPolicy
  attr_reader :current_user, :customer
  
  def initialize(current_user, customer)
    puts "DOES THIS WORK"
    @current_user = current_user
    @customer = customer
  end
  
  def create?
    puts 'hello world'
    true
  end
  
end