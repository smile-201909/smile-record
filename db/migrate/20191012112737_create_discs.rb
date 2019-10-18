class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :product_id, null: false
      t.integer :disc_num
      t.string :disc_name

      t.timestamps
    end
  end
end
