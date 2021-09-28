class Blog < ApplicationRecord

  has_one_attached :blog_image

  has_many :blog_comments, dependent: :destroy

  # 評価の平均
  def avg_score
    unless self.blog_comments.empty?
      blog_comments.average(:evaluation).round(1).to_f
    else
      0.0
    end
  end

  # 評価の％
  def review_score_percentage
    unless self.blog_comments.empty?
      blog_comments.average(:evaluation).round(1).to_f*100/5
    else
      0.0
    end
  end

  # validates :blog_image, attached_file_presence: true
  # ↑別パターンのバリデーション（今回は使わない）
  validates :blog_image, presence: true, blob: { content_type: :image }
  validates :title, presence: true
  validates :text, presence: true

end
