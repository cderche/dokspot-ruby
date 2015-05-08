class AddProductToCustomers < ActiveRecord::Migration
  def self.up
	add_reference :customers, :product, :index => true
  end

  def self.down
    remove_reference :customers, :product, :index => true
  end
end
