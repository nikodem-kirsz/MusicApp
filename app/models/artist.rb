class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :songs, dependent: :destroy
  validates_associated :songs
  validates :name, uniqueness: true, presence: true, length: { maximum: 60 }
  validates :origin, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  validates :user_id, presence: true

<<<<<<< HEAD
  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => {
                                        :bucket => ENV['S3_BUCKET_NAME'],
                                        :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                                        :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                                       }

=======
  has_attached_file :image
  validates :image, presence: true
>>>>>>> rspec
  validates_attachment_content_type :image, content_type: ['image/jpeg', 'image/png', 'image/bmp']
end