class BlogsController < ApplicationController
  before_action :ensure_logged_in
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
  
  # def create
  #   @blog = Blog.new(blog_params)
  #   @blog.owner_id = current_user.id
  #   if @blog.save
  #     redirect_to blog_url(@blog)
  #   else
  #     flash.now[:errors] = @blog.errors.full_messages
  #     render :new
  #   end
  # end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy!
    redirect_to :root
  end
  
  def edit
    @blog = Blog.find(params[:id])
    render :edit
  end
  
  def new
    @blog = Blog.new
    render :new
  end
  
  def show
    @blog = Blog.find(params[:id])
    render :show
  end
  
  def update
    @blog = Blog.find(params[:id])
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
    Blog.find(params[:id])
  end
  
  def ensure_blog_owner
    redirect_to :root unless current_blog.owner == current_user
  end
end