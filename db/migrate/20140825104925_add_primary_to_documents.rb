class AddPrimaryToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :primary, :boolean
  end
end
