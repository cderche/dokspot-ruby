class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :code, :string
    add_column :orders, :reviewed, :boolean
  end
end
