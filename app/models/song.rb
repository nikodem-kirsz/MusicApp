class Song < ActiveRecord::Base
  # /etc/init.d/elasticsearch restart
  searchkick
  belongs_to :artist
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 30 }
  validates :artist_id, presence: true
  validates :image, :mp3, presence: true
  validates :genre, presence: true, inclusion: { in: %w(Alternative Rock Blues Electronic Folk Grunge New\ Wave Punk\ Rock Metal Pop None) }
  
  has_attached_file :image,
                    :storage => :s3,
                    :bucket =>S3_CONFIG["bucket"],
                    :s3_credentials => {
                                        :access_key_id => S3_CONFIG["access_key_id"],
                                        :secret_access_key => S3_CONFIG["secret_access_key"]
                                       }

  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'image/bmp']

  has_attached_file :mp3,
                    :storage => :s3,
                    :bucket =>S3_CONFIG["bucket"],
                    :s3_credentials => {
                                        :access_key_id => S3_CONFIG["access_key_id"],
                                        :secret_access_key => S3_CONFIG["secret_access_key"]
                                       }

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