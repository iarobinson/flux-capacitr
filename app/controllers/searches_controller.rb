class SearchesController < ApplicationController
  def create
    redirect_to search_url(params["search_query"])
  end
  
  def show
    @query = params[:query]
    render :show
  end
end