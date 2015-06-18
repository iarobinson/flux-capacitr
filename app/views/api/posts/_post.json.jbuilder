json.extract!(
  post,
  :id,
  :author_id,
  :blog_id,
  :title,
  :body,
  :created_at,
  :updated_at
)

json.author do
  json.(post.author, :id, :username, :avatar_url)
end

json.blog_url post.blog.url

if current_user
  json.like post.likes.find_by(user_id: current_user.id)
end

json.has_like_button (logged_in? && current_user != post.author)

json.is_author (current_user == post.author)

json.is_liked post.is_liked_by?(current_user)

json.num_likes post.likes.count

json.tags do
  json.array! post.tags do |tag|
    json.partial! 'api/tags/tag', tag: tag
  end
end

if post.persisted?
  json.time_ago "#{time_ago_in_words(post.created_at)} ago"
  json.url "posts/#{post.id}"
end

