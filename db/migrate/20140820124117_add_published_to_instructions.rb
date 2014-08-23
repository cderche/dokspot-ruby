class AddPublishedToInstructions < ActiveRecord::Migration
  def change
    add_column :instructions, :published, :boolean
  end
end
