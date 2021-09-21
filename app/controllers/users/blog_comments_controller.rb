class Users::BlogCommentsController < ApplicationController

  def create
    @blog = Blog.find(params[:post_id])
    blog_comment = BlogComment.new(blog_comment_params)
    blog_comment.user_id = current_user.id
    blog_comment.post_id = @blog.id
    if blog_comment.save
      redirect_to blog_path(post)
    else
      render 'error'
      # 後で確認
    end
  end

  def destroy
    @blog = blog.find(params[:blog_id])
    blog_comment = @blog.blog_comments.find(params[:id])
    blog_comment.destroy
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end

end
