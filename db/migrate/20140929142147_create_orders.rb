class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :instruction, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
