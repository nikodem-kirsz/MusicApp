class Artist < ActiveRecord::Base
	belongs_to :user
	has_many :songs, dependent: :destroy
	validates :name, :origin, :genres, presence: true, length: { maximum: 50 }
	validates :description, presence: true

	has_attached_file :image, :styles => { :medium => "180x180#", :small => "64x64#", :tiny => "24x24#" }
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
