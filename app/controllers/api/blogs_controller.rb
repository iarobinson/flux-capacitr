module Api
  class BlogsController < ApiController
    def show
      @blog = Blog.friendly
                  .find(params[:id])
                  
      @posts = @blog.posts
                    .includes([:author, :blog, :users_liked_by, :tags])
                    .page(params[:page])
                
      render 'show.json.jbuilder'
    end
    
    def search
      query = "%#{params[:query]}%"
      @blogs = Blog.where(
        "url LIKE ? OR title LIKE ?", query, query
      ).page(params[:page])
      render 'index.json.jbuilder'
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