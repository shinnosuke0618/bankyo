class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true
  validates :body, presence: true

  def get_image
    (image.attached?) ? image : 'no_image1.jpg'
  end
  
end
