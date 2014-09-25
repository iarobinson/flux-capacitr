module Api
  class BlogsController < ApiController
    def show
      @blog = Blog.includes(:followers)
                  .includes(:posts)
                  .friendly
                  .find(params[:id])
      render 'show.json.jbuilder'
    end
  end
end