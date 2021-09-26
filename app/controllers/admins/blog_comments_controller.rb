class Admins::BlogCommentsController < ApplicationController

  before_action :authenticate_admin!

  def destroy
    @blog = Blog.find(params[:blog_id])
    blog_comment = @blog.blog_comments.find(params[:id])
    blog_comment.destroy
    redirect_to admins_blog_path(@blog)
  end

end
