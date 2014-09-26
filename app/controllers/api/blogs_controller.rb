module Api
  class BlogsController < ApiController
    def show
      @blog = Blog.includes(:followers)
                  .friendly
                  .find(params[:id])
                  
      @posts = @blog.posts.page(params[:page])
      render 'show.json.jbuilder'
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