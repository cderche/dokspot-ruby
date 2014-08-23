class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :comment
      t.string :file
      t.string :version

      t.timestamps
    end
  end
end
