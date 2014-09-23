class PostController < ApplicationController
  def create
    # fail # check params for blog id
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @post = Blog.find(params[:id])
    @post.destroy!
    redirect_to :root
  end
  
  def edit
    @post = Blog.find(params[:id])
    render :edit
  end
  
  def new
    @post = Blog.new
    render :new
  end
  
  def show
    @post = Blog.find(params[:id])
    render :show
  end
  
  def update
    @post = Blog.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end