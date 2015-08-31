class AddVisitsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :visits, :integer, default: 0
    add_index :songs, :visits
  end
end
