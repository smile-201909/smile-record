class CreateReceiptItems < ActiveRecord::Migration[5.2]
  def change
    create_table :receipt_items do |t|
      t.integer :receipt_id, null: false
      t.string :product_name
      t.text :product_image_id
      t.integer :price
      t.integer :product_amount

      t.timestamps
    end
  end
end
