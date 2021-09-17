class Users::ChatRoomsController < ApplicationController

  def index
    @chat_room = Chat_room.new
    @chat_rooms = Chat_room.all
  end

  def show
    @chat_room = Chat_room.find(params[:id])
    @chat = Chat.new
  end

  def create
    @chat_room = Chat_room.new(chat_room_params)
    @chat_room.user_id = current_user.id
    if @chat_room.save
      # flash[:notice] = "You have created book successfully."
      redirect_to chat_room_path(@chat_room)
    else
      @chat_rooms = Chat_room.all
      render :index
    end
  end

  def destroy
    @chat_room = Chat_room.find(params[:id])
    @chat_room.destroy
    redirect_to chat_rooms_path
  end

  def chat_room_params
    params.require(:chat_room).permit(:room_name)
  end

end
