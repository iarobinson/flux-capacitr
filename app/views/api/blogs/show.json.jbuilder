json.(@blog, :id, :title, :url, :owner_id, :created_at, :updated_at)

json.full_url "#{request.domain}/#{@blog.url}"

json.is_owner current_user && current_user == @blog.owner

json.is_followed current_user && current_user.followed_blogs.include?(@blog)

json.posts @posts do |post|
  json.partial! 'api/posts/post', post: post
end

json.show_controls logged_in?

json.page params[:page] || 1
json.total_pages @posts.total_pages