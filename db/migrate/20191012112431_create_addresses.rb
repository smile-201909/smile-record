class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.boolean :main_address
      t.string :pulldown_name, null: false
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :post, null: false
      t.text :a_address, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
