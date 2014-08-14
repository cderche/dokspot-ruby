class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :content
      t.string :category
      t.references :product, index: true
      t.date :expiration
      t.boolean :published

      t.timestamps
    end
  end
end
