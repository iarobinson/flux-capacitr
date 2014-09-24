module Api
  class PostsController < ApiController
    def show
      @post = Post.find(params[:id])
      render json: @post
    end
  end
end