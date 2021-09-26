class Chat < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :chat_room, optional: true

  validates :response, presence: true

end
