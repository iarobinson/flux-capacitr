module Api
  class PostsController < ApiController
    before_action :ensure_logged_in, except: [:index]
    
    def create
      @post = current_user.posts.new(post_params)
      ensure_blog_owner(@post.blog)
    
      if @post.save
        @post.assign_tags(params[:tags])
        render partial: 'post', locals: {post: @post}
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    def destroy
      @post = Post.find(params[:id])
      ensure_blog_owner(@post.blog)
      @post.destroy!
      render json: {}
    end
    
    def index
      if params[:blog_id]
        @posts = Blog.find(params[:blog_id]).posts.page(params[:page])
      else
        @posts = current_user.feed_posts.page(params[:page])
      end
      render 'index.json.jbuilder'
    end
    
    def search
      query = "%#{params[:query]}%"
      @posts = Post.where(
        "title LIKE ? OR body LIKE ?", query, query
      ).page(params[:page])
      render 'index.json.jbuilder'
    end
    
    def toggle_like
      @post = Post.find(params[:id])
      if @post.is_liked_by?(current_user)
        current_user.liked_posts.delete(@post)
      else
        current_user.liked_posts << @post
      end
      render partial: 'post', locals: {post: @post}
    end
    
    def update
      @post = Post.find(params[:id])
      ensure_blog_owner(@post.blog)
      
      if @post.update_attributes(post_params)
        @post.assign_tags(params[:tags])
        render partial: 'post', locals: {post: @post}
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    private
    
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
end