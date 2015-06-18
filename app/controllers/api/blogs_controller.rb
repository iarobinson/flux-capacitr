module Api
  class BlogsController < ApiController
    def show
      @blog = Blog.includes(:posts => [:author, :users_liked_by, :tags])
        .friendly
        .find(params[:id])

      render :show
    end

    def index
      query = "%#{params[:query]}%"
      @blogs = Blog.
        where("url LIKE ? OR title LIKE ?", query, query).
        page(params[:page])
      render :index
    end

    def toggle_follow
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
