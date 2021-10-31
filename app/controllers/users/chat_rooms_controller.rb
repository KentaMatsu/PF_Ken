class Users::ChatRoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @chat_rooms = ChatRoom.page(params[:page]).per(10).reverse_order
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @chat = Chat.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    @chat_room.user_id = current_user.id
    if @chat_room.save!
      redirect_to chat_room_path(@chat_room)
    else
      @chat_rooms = ChatRoom.all
      render :index
    end
  end

  def destroy
    @chat_room = ChatRoom.find(params[:id])
    if @chat_room.user_id != current_user.id
      redirect_to chat_rooms_path
    else
      @chat_room.destroy
      redirect_to chat_rooms_path
    end
  end

  private

    def chat_room_params
      params.require(:chat_room).permit(:room_name)
    end

    def sort_params
      params.permit(:sort)
    end

end
