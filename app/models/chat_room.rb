class ChatRoom < ApplicationRecord

  belongs_to :user, optional: true
  has_many :chats, dependent: :destroy

  validates :room_name, presence: true

end
