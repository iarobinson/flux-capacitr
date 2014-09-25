module Api
  class FollowingsController < ApiController
    def toggle
      @blog = Blog.find(params[:id])
      if current_user.is_following?(@blog)
        current_user.followed_blogs.delete(@blog)
      else
        current_user.followed_blogs << @blog
      end
      render json: @blog
    end
  end
end