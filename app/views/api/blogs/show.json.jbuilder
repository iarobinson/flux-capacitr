json.(@blog, :id, :title, :url, :owner_id, :created_at, :updated_at)

json.full_url "#{request.domain}/#{@blog.url}"

json.is_owner current_user == @blog.owner

json.is_followed current_user.followed_blogs.include?(@blog)

json.posts @blog.posts do |post|
  json.partial! 'api/posts/post', post: post
end