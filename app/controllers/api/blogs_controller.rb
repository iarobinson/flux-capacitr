module Api
  class BlogsController < ApiController
    def show
      if params[:id]
        @blog = Blog.find(params[:id])
      else
        @blog = Blog.find_by_url(params[:blog_url])
      end
      render 'show.json.jbuilder'
    end
  end
end