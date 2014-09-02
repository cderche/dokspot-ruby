class ChangeCategoryInNotifications < ActiveRecord::Migration
  def up
    change_column :notifications, :category, 'integer USING CAST(category AS integer)'
  end

  def down
    change_column :notifications, :category, :string
  end
end
