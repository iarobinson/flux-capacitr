class SearchesController < ApplicationController
  def create
    redirect_to search_url(params["search_query"])
  end
  
  def show
    @blogs = Blog.where(
      "url LIKE ? OR title LIKE ?", params[:query], params[:query]
    )
    render :show
  end
end