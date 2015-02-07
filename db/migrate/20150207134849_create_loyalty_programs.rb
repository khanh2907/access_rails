class CreateLoyaltyPrograms < ActiveRecord::Migration
  def change
    create_table :loyalty_programs do |t|
      t.integer :store_id
      t.integer :s_id
      t.integer :s_type
      t.date :start_date
      t.date :end_date
      t.integer :s_required
      t.float :s_discount

      t.timestamps
    end
  end
end
