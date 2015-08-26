class Song < ActiveRecord::Base
	belongs_to :artist
	validates :title, presence: true, length: { maximum: 30 }
	validates :artist_id, presence: true
	has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
