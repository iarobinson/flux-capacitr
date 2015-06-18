json.extract! blog, :id, :title, :url, :owner_id, :created_at, :updated_at

json.full_url "#{request.domain}/#{blog.url}"

if logged_in?
  json.is_member current_user.is_member?(blog)

  json.is_owner current_user.owns?(blog)

  json.is_followed current_user.is_following?(blog)

  json.following blog.followings.find_by(follower_id: current_user.id)
end
