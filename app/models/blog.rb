class Blog < ApplicationRecord

  has_one_attached :blog_image

  has_many :blog_comments, dependent: :destroy

  # validates :blog_image, attached_file_presence: true
  # ↑別パターンのバリデーション（今回は使わない）
  validates :blog_image, presence: true, blob: { content_type: :image }
  validates :title, presence: true
  validates :text, presence: true

end
