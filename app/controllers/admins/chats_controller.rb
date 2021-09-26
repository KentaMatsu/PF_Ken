class Admins::ChatsController < ApplicationController

  before_action :authenticate_admin!

  def destroy
    @chat_room = ChatRoom.find(params[:chat_room_id])
    chat = @chat_room.chats.find(params[:id])
    chat.destroy
    redirect_to admins_chat_room_path(@chat_room.id)
  end

end
