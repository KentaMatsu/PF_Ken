class Blog < ApplicationRecord

  has_one_attached :image

  has_many :blog_comments, dependent: :destroy

end
