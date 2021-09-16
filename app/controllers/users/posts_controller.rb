class Users::PostController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user_id
    if @post.save
      #flash[:notice] = "You have created book successfully."
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user)
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :post_image)
    end

end
