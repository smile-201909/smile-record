class CreateArrivals < ActiveRecord::Migration[5.2]
  def change
    create_table :arrivals do |t|
      t.integer :stock_id, null: false
      t.integer :arrival_amount, null: false

      t.timestamps
    end
  end
end
