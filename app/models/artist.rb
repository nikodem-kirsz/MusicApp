class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :songs, dependent: :destroy
	validates_associated :songs
	validates :name, uniqueness: true, presence: true, length: { maximum: 60 }
	validates :origin, presence: true, length: { maximum: 50 }
	validates :description, presence: true

	has_attached_file :image
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'image/bmp']
end
