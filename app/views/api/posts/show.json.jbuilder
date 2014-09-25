json.(@post, :id, :title, :body, :author_id, :created_at, :updated_at)

if current_user == @post.author
  json.is_author true
end

json.blog_url @post.blog.url

json.time_ago "#{time_ago_in_words(post.created_at)} ago"

json.url "#posts/#{post.id}"