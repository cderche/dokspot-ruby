class AddLocalToLanguages < ActiveRecord::Migration
  def self.up
	add_column :languages, :local, :string
  end

  def self.down
    remove_column :languages, :local, :string
  end
end
