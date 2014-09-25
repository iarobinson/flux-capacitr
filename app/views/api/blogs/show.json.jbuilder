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
  if current_user == post.author
    json.is_author true
  end
  
  json.blog_url @blog.url
  
  json.time_ago "#{time_ago_in_words(post.created_at)} ago"
  
  json.url "#posts/#{post.id}"
end