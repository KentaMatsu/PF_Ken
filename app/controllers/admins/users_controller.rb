class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_user_path(@user)
  end

  protected

  def user_params
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :user_image, :user_name, :text, :is_deleted )
  end

end
