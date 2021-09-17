class Users::BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = Blog_comment.new
  end

end
