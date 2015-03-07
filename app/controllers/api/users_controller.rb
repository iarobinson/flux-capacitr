module Api
  class UsersController < ApiController
    def show
      @user = User.includes(:blogs, :member_blogs, :followed_blogs)
        .find(params[:id])
      render :show
    end

    def current
      @user = current_user
      render :show
    end
  end
end
