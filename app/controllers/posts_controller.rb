class PostsController < ApplicationController
  
  def create
    @post = current_user.posts.new(post_params)
    ensure_blog_owner(@post.blog)
    
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
    redirect_to :root
  end
  
  def edit
    @post = Post.find(params[:id])
    render :edit
  end
  
  def new
    @post = current_blog.posts.new
    render :new
  end
  
  def show
    @post = Post.find(params[:id])
    render :show
  end
  
  def update
    @post = Post.find(params[:id])
    ensure_blog_owner(@post.blog)
    
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  private
  def current_blog
    Blog.find(params[:blog_id])
  end
  
  def ensure_blog_owner(blog)
    if blog.owner != current_user
      flash[:errors] = ["You must be the blog's owner to perform that action!"]
      redirect_to :root
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :blog_id)
  end
end