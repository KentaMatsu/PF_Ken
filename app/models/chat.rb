class Chat < ApplicationRecord

  belongs_to :users
  belongs_to :chat_rooms

end
