class Changenull < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :addresses, :family_name_kana, true, nil
  	change_column_null :addresses, :first_name_kana, true, nil
  	change_column_null :addresses, :family_name, true, nil
  	change_column_null :addresses, :first_name, true, nil
  end
end
