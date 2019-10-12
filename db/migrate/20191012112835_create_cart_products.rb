class CreateCartProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_products do |t|
      t.integer :cart_id, null: false
      t.integer :product_id, null: false
      t.integer :product_amount, null: false

      t.timestamps
    end
  end
end
