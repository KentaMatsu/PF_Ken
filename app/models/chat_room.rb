class ChatRoom < ApplicationRecord

  belongs_to :user, optional: true
  has_many :chats, dependent: :destroy


  def sort_chat_rooms(sort)
    if sort[:sort] == "updated_at_asc"
      order("updated_at ASC")
    elsif sort[:sort] == "updated_at_desc"
      order("updated_at DESC")
    end
  end

  scope :sort_list, -> {
    {
      "並び替え" => "",
      "作成の古い順" => "updated_at_asc",
      "作成の新しい順" => "updated_at_desc",
      #"コメントの多い順" => "resources desc"
    }
  }

  validates :room_name, presence: true

end
