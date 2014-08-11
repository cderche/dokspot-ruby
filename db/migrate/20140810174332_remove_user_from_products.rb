class RemoveUserFromProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :user, index: true
  end
end
