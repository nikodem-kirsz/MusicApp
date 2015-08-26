class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :songs, dependent: :destroy
	validates :name, :origin, :genres, presence: true, length: { maximum: 50 }
	validates :description, presence: true

	has_attached_file :image, :styles => { :medium => "300x300>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
