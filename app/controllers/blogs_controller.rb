class BlogsController < ApplicationController
  before_action :ensure_logged_in, except: [:show]
  before_action :ensure_blog_owner, except: [:create, :new, :show]
  
  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      redirect_to blog_url(@blog)
    else
      flash.now[:errors] = @blog.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @blog = Blog.friendly.find(params[:id])
    @blog.destroy!
    redirect_to :root
  end
  
  def edit
    @blog = Blog.friendly.find(params[:id])
    render :edit
  end
  
  def new
    @blog = Blog.new
    render :new
  end
  
  def show
    redirect_to "/#blogs/#{params[:id]}"
  end
  
  def update
    @blog = Blog.friendly.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_url(@blog)
    else
      flash.now[:errors] = @blog.errors.full_messages
      render :edit
    end
  end
  
  private
  
  def blog_params
    params.require(:blog).permit(:title, :url)
  end
  
  def current_blog
    Blog.friendly.find(params[:id])
  end
  
  def ensure_blog_owner
    redirect_to :root unless current_blog.owner == current_user
  end
end