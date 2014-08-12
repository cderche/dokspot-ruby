class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.references :product, index: true
      t.references :language, index: true

      t.timestamps
    end
  end
end
