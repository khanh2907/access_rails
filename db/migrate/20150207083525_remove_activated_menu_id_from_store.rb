class RemoveActivatedMenuIdFromStore < ActiveRecord::Migration
  def change
    remove_column :stores, :active_menu_id
  end
end
