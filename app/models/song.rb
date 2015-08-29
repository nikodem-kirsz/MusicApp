class Song < ActiveRecord::Base
	belongs_to :artist
  has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { maximum: 30 }
	validates :artist_id, presence: true
	validates :image, :mp3, presence: true
  validates :genre, presence: true, inclusion: { in: %w(Alternative Rock Blues Electronic Folk Grunge New\ Wave Punk\ Rock None) }

	has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'image/bmp']

  has_attached_file :mp3
  validates_attachment_content_type :mp3, content_type: ['audio/mp3', 'audio/mpeg']

  def Song.selected(genre)
    songs = []
    Song.all.each do |song|
      if song.genre == genre
        songs.push(song)
      end
    end
    return songs
  end
end
