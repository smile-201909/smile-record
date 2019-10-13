class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :user_id, null: false
      t.string :purchaser, null: false
      t.integer :settlement, null: false
      t.text :delivery_address, null: false
      t.integer :total_price, null: false
      t.integer :postage, null: false
      t.integer :status, null: false
      t.string :post, null: false

      t.timestamps
    end
  end
end
