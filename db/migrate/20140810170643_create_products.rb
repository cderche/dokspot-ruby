class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :uuid
      t.boolean :published
      t.references :company, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
