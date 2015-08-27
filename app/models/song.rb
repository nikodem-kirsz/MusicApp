class Song < ActiveRecord::Base
	belongs_to :artist
	validates :title, presence: true, length: { maximum: 30 }
	validates :artist_id, presence: true
	validates :image, :mp3, presence: true

	has_attached_file :image, styles: { medium: "180x180#", small: "64x64#", tiny: "24x24#" }
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png']

  has_attached_file :mp3
  # validates_attachment_content_type :mp3, content_type: ['audio/mp3']
end
