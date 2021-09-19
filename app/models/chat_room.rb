class ChatRoom < ApplicationRecord

  belongs_to :user, optional: true
  has_many :chat, dependent: :destroy

end
