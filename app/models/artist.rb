class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, dependent: :destroy
  validates_associated :songs
  validates :name, uniqueness: true, presence: true, length: { maximum: 60 }
  validates :origin, presence: true, length: { maximum: 50 }
  validates :description, presence: true

  has_attached_file :image,
                    :storage => :s3,
    								:bucket =>S3_CONFIG["bucket"],
    								:s3_credentials => {
      																	:access_key_id => S3_CONFIG["access_key_id"],
      																	:secret_access_key => S3_CONFIG["secret_access_key"]
      																 }

  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'image/bmp']
end