class AddIndexToArtists < ActiveRecord::Migration
  def change
    add_index :artists, :user_id
  end
end
