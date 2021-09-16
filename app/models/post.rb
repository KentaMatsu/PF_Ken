class Post < ApplicationRecord

  has_one_attached :post_image

  belongs_to :users
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end
