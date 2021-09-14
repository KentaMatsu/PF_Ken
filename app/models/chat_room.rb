class ChatRoom < ApplicationRecord

  belongs_to :users
  has_many :chats, dependent: :destroy

end
