class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.page(params[:page]).per(8).reverse_order
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      #flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
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
    params.require(:user).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :profile_image, :user_name, :text, :is_deleted )
  end


end
