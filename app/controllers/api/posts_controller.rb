module Api
  class PostsController < ApiController
    def destroy
      @post = Post.find(params[:id])
      @post.destroy!
      render json: {}
    end
  end
end