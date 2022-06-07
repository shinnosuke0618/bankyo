class User < ApplicationRecord
  
  #パスワードのメソッド
  has_secure_password validations: true
  
  #バリデーション
  validates :email, presence: true, uniqueness: true
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :body, length: { maximum: 200 }
  
  #Active Storage
  has_one_attached :image
  
  #一対多の関係
  has_many :posts, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms
  
  #フォロー関係
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
  #Active Storage
  def get_image
    (image.attached?) ? image : 'no_image_man.jpg'
  end
end
