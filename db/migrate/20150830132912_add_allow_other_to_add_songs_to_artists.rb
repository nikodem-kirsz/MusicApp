class AddAllowOtherToAddSongsToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :allow_other_to_add_songs, :boolean, default: false
  end
end
