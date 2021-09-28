class Users::BlogsController < ApplicationController

  def index
    @blogs = Blog.page(params[:page]).per(5).reverse_order
  end

  def show
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
  end

end
