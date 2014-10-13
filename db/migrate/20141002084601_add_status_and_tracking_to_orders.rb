class AddStatusAndTrackingToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :status, :integer
    add_column :orders, :track, :string
  end
end
