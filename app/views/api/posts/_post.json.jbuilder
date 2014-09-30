json.(post,
      :id,
      :author_id,
      :blog_id,
      :title,
      :body,
      :created_at,
      :updated_at)

json.author do
  json.(post.author, :id, :username, :avatar_url)
end

json.blog_url post.blog.url

json.has_like_button (logged_in? && current_user != post.author)

json.is_author (current_user == post.author)

json.is_liked post.is_liked_by?(current_user)

json.num_likes post.likes.count

json.tags post.tags.map { |tag| "##{tag.label}" }

json.time_ago "#{time_ago_in_words(post.created_at)} ago"

json.url "#posts/#{post.id}"