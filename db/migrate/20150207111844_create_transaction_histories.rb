class CreateTransactionHistories < ActiveRecord::Migration
  def change
    create_table :transaction_histories do |t|
      t.integer :item_id
      t.integer :payer_id
      t.integer :store_id
      t.float :amount
      t.string :cc_number
      t.timestamp :payment_time

      t.timestamps
    end
  end
end
