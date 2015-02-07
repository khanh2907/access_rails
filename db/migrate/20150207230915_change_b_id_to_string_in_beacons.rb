class ChangeBIdToStringInBeacons < ActiveRecord::Migration
  def change
    change_column :beacons, :b_id, :string
  end
end
