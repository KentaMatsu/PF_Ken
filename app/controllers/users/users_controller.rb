class Users::UsersController < ApplicationController

  def index
    
  end

  def show
    
  end

  def edit
    @user = current_user
  end
  
  def update
    
  end

  def check
  end

  def hide
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def users_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :image, :user_name, :text, :is_deleted )
  end


end
