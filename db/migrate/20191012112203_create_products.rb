class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.text :product_image_id
      t.integer :artist_id, null: false
      t.integer :genre_id, null: false
      t.integer :label_id, null: false
      t.integer :status, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end
