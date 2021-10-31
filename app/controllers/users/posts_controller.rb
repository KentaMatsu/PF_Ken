class Users::PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save!
      tags = Vision.get_image_data(@post.post_image)
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @posts = Post.page(params[:page]).per(5).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path
    end
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user_id != current_user.id
      redirect_to posts_path
    else
      @post.destroy
      redirect_to user_path(@post.user)
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :text, :post_image)
    end

end
