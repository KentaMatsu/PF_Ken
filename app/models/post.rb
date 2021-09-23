class Post < ApplicationRecord

  has_one_attached :post_image

  belongs_to :user, optional: true
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by(user)
    likes.where(user_id: user.id).exists?
  end

end
