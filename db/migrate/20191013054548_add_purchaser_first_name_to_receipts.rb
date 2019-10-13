class AddPurchaserFirstNameToReceipts < ActiveRecord::Migration[5.2]
  def change
    add_column :receipts, :purchaser_first_name, :string
  end
end
