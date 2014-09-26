module Api
  class BlogsController < ApiController
    def show
      @blog = Blog.includes(:followers)
                  .friendly
                  .find(params[:id])
                  
      @posts = @blog.posts.page(params[:page])
      render 'show.json.jbuilder'
    end
  end
end