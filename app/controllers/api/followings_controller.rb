module Api
  class FollowingsController < ApiController
    before_action :ensure_logged_in
    before_action :ensure_not_blog_owner, only: [:create]

    def create
      @following = current_user.followings.new(following_params)
      save_and_render(@following)
    end

    def destroy
      @following = Following.find(params[:id])
      @following.destroy
      render json: @following
    end

    private
    def current_blog
      @current_blog ||= Blog.find(params[:blog_id])
    end

    def ensure_not_blog_owner
      if current_blog.owner == current_user
        render json: ["You cannot follow your own blog!"], status: :unownerized
      end
    end

    def following_params
      params.require(:following).permit(:blog_id)
    end
  end
end
