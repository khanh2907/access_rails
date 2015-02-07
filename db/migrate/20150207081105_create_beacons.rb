class CreateBeacons < ActiveRecord::Migration
  def change
    create_table :beacons do |t|
      t.integer :store_id
      t.integer :menu_id
      t.integer :b_id

      t.timestamps
    end
  end
end
