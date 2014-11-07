class AddReasonToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :reason, :string
  end
end
