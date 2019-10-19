class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :user_id, null: false
      t.string :purchaser
      t.integer :settlement
      t.text :delivery_address
      t.integer :total_price
      t.integer :postage
      t.integer :status
      t.string :post

      t.timestamps
    end
  end
end
