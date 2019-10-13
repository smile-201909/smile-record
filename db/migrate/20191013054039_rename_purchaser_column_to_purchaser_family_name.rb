class RenamePurchaserColumnToPurchaserFamilyName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :receipts, :purchaser, :purchaser_family_name
  end
end
