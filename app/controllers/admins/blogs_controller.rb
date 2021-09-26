class Admins::BlogsController < ApplicationController

  before_action :authenticate_admin!

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save!
      redirect_to admins_blog_path(@blog)
    else
      render "new_admins_blog_path"
    end
  end

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to admins_blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to admins_blogs_path
  end

  private

    def blog_params
      params.require(:blog).permit(:title, :text, :blog_image)
    end

end
