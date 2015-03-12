class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.references :band, null: false
      t.string :performance, null: false

      t.timestamps null: false
    end
  end
end
