class Blog < ApplicationRecord

  has_one_attached :blog_image

  has_many :blog_comments, dependent: :destroy

  #validates :blog_image, attached_file_presence: true

end
