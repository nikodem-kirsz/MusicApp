class AddIndexToSongs < ActiveRecord::Migration
  def change
    add_index :songs, :genre
    add_index :songs, :artist_id
  end
end
