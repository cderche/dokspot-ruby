class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :company
      t.string :address1
      t.string :address2
      t.string :postcode
      t.string :city
      t.string :country
      t.text :notes
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
