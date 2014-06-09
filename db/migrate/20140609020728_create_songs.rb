class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :artist_name
    end
  end
end
