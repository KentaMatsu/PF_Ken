class Admins::ChatRoomsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
  end

  def destroy
    @chat_room = Chat_room.find(params[:id])
    @chat_room.destroy
    redirect_to admins_chat_rooms_path
  end

end
