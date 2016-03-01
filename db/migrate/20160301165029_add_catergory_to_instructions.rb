class AddCatergoryToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :category, :integer
  end
end
