class BlogsController < ApplicationController
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
    @blog = Blog.find(params[:id])
    blog.destroy!
    redirect_to :root
  end
  
  def edit
    @blog = Blog.find(:id)
    render :edit
  end
  
  def new
    @blog = Blog.new
    render :new
  end
  
  def show
    @blog = Blog.find(:id)
    render :show
  end
  
  def update
    @blog = Blog.find(:id)
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
end