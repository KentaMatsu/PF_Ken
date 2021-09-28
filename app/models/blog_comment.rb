class BlogComment < ApplicationRecord

  belongs_to :blog, optional: true
  belongs_to :user, optional: true

  validates :comment, presence: true
  validates :evaluation, presence: true
end
