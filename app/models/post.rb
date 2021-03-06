class Post < ApplicationRecord

  #バリデーション
  validates :title, presence: true
  validates :body, presence: true, length:{maximum:400}

  #Active Storage
  has_one_attached :image

  #多対一
  belongs_to :user

  #一対多
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  #いいね関係
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end

  def get_image
    (image.attached?) ? image : 'no_image1.jpg'
  end

end
