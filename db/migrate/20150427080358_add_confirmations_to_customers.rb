class AddConfirmationsToCustomers < ActiveRecord::Migration
  def self.up
	add_column :customers, :email_confirmation, :string
	add_column :customers, :telephone_confirmation, :string
  end

  def self.down
    remove_column :customers, :email_confirmation, :string
	remove_column :customers, :telephone_confirmation, :string
  end
end
