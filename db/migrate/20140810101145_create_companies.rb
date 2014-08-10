class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :symbol
      t.string :website
      t.string :contact
      t.string :order_email

      t.timestamps
    end
  end
end
