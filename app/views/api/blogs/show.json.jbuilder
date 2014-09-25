json.(@blog, :id, :title, :url, :owner_id, :created_at, :updated_at)

json.full_url "#{request.domain}/#{@blog.url}"

if current_user == @blog.owner
  json.is_owner true
end

json.posts @blog.posts do |post|
  json.partial! 'api/posts/post', post: post
end