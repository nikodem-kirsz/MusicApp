class AddAttachmentMp3ToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :songs, :mp3
  end
end
