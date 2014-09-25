module Api
  class PostsController < ApiController
    def destroy
      @post = Post.find(params[:id])
      @post.destroy!
      render json: {}
    end
    
    # def show
    #   @post = Post.find(params[:id])
    #   render :show
    # end
    
    def update
      @post = Post.find(params[:id])
      
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors.full_messages, status: :unprocessable_entity
      end
    end
    
    private
    
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end