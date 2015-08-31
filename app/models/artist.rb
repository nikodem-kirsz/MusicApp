class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, dependent: :destroy
  validates_associated :songs
  validates :name, uniqueness: true, presence: true, length: { maximum: 60 }
  validates :origin, presence: true, length: { maximum: 50 }
  validates :description, presence: true

  has_attached_file :image,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                                        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                                        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                                       }

  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'image/bmp']
end