class Admins::PostCommentsController < ApplicationController

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = @post.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to admins_post_path(@post)
  end

end
