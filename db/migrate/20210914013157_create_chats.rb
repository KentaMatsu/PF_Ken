class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :chat_room_id, null: false, default: ""
      t.integer :user_id, null: false, default: ""
      t.text :response, null: false, default: ""

      t.timestamps
    end
  end
end
