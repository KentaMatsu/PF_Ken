class Users::ChatsController < ApplicationController

  def create
    @chat_room = Chat_room.find(params[:chat_room_id])
    chat = Chat.new(chat_params)
    chat.chat_room_id = @chat_room.id
    chat.user_id = current_user.id
    if chat.save
      redirect_to chat_room_path
    else
      render 'chat_rooms/show'
    end
  end

  def destroy
    @chat_room = Chat_room.find(params[:chat_room_id])
    chat = @chat_room.chat.find(params[:id])
    chat.destroy
    redirect_to chat_room_path
  end

  def chat_params
    params.require(:chat).permit(:response)
  end

end
