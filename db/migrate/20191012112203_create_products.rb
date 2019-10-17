class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :product_image_id
      t.integer :artist_id
      t.integer :genre_id
      t.integer :label_id
      t.integer :status
      t.integer :price

      t.timestamps
    end
  end
end
