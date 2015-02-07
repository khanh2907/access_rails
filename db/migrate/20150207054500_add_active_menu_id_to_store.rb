class AddActiveMenuIdToStore < ActiveRecord::Migration
  def change
    add_column :stores, :active_menu_id, :integer
  end
end
