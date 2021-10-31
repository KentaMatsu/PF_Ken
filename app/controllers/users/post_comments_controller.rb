class Users::PostCommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    post_comment = PostComment.new(post_comment_params)
    post_comment.user_id = current_user.id
    post_comment.post_id = @post.id
    if post_comment.save
      redirect_to post_path(@post)
    else
      @user = @book.user
      render 'error'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    if @post.user_id != current_user.id
      redirect_to post_path(@post)
    end
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to post_path(@post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
