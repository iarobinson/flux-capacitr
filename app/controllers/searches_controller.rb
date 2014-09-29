class SearchesController < ApplicationController
  def create
    redirect_to search_url(params["search_query"])
  end
  
  def show
    query = "%#{params[:query]}%"
    @blogs = Blog.where(
      "url LIKE ? OR title LIKE ?", query, query
    )
    @posts = Post.where(
      "title LIKE ? OR body LIKE ?", query, query
    )
    render :show
  end
end