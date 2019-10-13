class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :product_id, null: false
      t.integer :stock_amount, null: false

      t.timestamps
    end
  end
end
