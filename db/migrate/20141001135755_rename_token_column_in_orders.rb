class RenameTokenColumnInOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :uuid, :token
  end
end
