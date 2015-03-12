class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :album, index: true, null: false
      t.string :title, null: false
      t.string :special, null: false

      t.timestamps null: false
    end
    add_foreign_key :tracks, :albums
  end
end
