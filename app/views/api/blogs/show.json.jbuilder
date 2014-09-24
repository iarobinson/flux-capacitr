json.(@blog, :id, :title, :url, :owner_id, :created_at, :updated_at)

json.full_url "#{request.domain}/#{@blog.url}"

if current_user == @blog.owner
  json.is_owner true
end

json.posts @blog.posts do |post|
  json.(post,
        :id,
        :author_id,
        :blog_id,
        :title,
        :body,
        :created_at,
        :updated_at)
end