class BlogsController < ApplicationController
  before_action :ensure_logged_in, except: [:followers, :lucky, :show]
  before_action :ensure_blog_owner, only: [
    :add_members, :destroy, :edit, :remove_member, :update
  ]
  
  def add_members
    @blog = Blog.friendly.find(params[:blog_id])
    
    new_members = params['blog']['members'].map do |name|
      User.find_by_username(name)
    end
    
    new_members = new_members.compact.uniq
    new_members.each do |member|
      @blog.members << member
    end
    
    redirect_to blog_url(@blog)
  end
  
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
  
  def followers
    @blog = Blog.friendly.find(params[:blog_id])
    render :followers
  end
  
  def lucky
    @blog = Blog.all.sample
    redirect_to blog_url(@blog)
  end
  
  def new
    @blog = Blog.new
    render :new
  end
  
  def remove_member
    @user = User.friendly.find(params[:user_id])
    @blog = Blog.friendly.find(params[:blog_id])
    @blog.members.delete(@user)
    redirect_to blog_url(@blog)
  end
  
  def show
    @blog = Blog.friendly.find(params[:id])
    render :show
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
    Blog.friendly.find(params[:id] || params[:blog_id])
  end
  
  def ensure_blog_owner
    redirect_to :root unless current_blog.owner == current_user
  end
end