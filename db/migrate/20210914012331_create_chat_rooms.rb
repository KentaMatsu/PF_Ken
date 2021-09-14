class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.integer :user_id, null: false, default: ""
      t.string :room_name, null: false, default: ""

      t.timestamps
    end
  end
end
