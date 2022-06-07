class User < ApplicationRecord
  has_secure_password validations: true

  validates :email, presence: true, uniqueness: true
  
  has_many :posts, dependent: :destroy
  
  has_one_attached :image
  
  def get_image
    (image.attached?) ? image : 'no_image_man.jpg'
  end
end
