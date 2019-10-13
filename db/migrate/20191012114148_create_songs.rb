class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id, null: false
      t.integer :song_num, null: false
      t.string :song_name, null: false

      t.timestamps
    end
  end
end
