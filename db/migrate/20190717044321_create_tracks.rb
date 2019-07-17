class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.references :album, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :ord, null: false
      t.text :lyrics
      t.boolean :bonus, default: false
    end
    add_index :tracks, :title
    add_index :tracks, %i(album_id ord), unique: true
  end
end
