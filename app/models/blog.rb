class Blog < ApplicationRecord

  has_many :blog_comments, dependent: :destroy

end
