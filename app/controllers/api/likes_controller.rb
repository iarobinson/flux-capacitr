module Api
  class LikesController < ApiController
    before_action :ensure_logged_in
    before_action :ensure_not_post_author, only: [:create]

    def create
      @like = current_user.likes.new(post_id: params[:post_id])
      save_and_render(@like)
    end

    def destroy
      @like = Like.find(params[:id])
      @like.destroy
      render json: @like
    end

    private
    def current_post
      @current_post ||= Post.find(params[:post_id])
    end

    def ensure_not_post_author
      if current_post.author == current_user
        render json: ["You cannot like your own post!"], status: :unauthorized
      end
    end

    def like_params
      params.require(:like).permit(:post_id)
    end
  end
end
