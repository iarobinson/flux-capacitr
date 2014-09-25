module Api
  class PostsController < ApiController
    def create
      @post = current_user.posts.new(post_params)
      ensure_blog_owner(@post.blog)
    
      if @post.save
        render json: @post
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    def destroy
      @post = Post.find(params[:id])
      @post.destroy!
      render json: {}
    end
    
    def update # need to exclude blog id when editing!
      @post = Post.find(params[:id])
      
      if @post.update_attributes(post_params)
        render json: @post
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