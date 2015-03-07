json.extract! @user, :id, :email, :username, :avatar_url

json.blogs do
  json.array! @user.blogs do |blog|
    json.partial! 'api/blogs/blog', blog: blog
  end
end

json.member_blogs do
  json.array! @user.member_blogs do |blog|
    json.partial! 'api/blogs/blog', blog: blog
  end
end

json.followed_blogs do
  json.array! @user.followed_blogs do |blog|
    json.partial! 'api/blogs/blog', blog: blog
  end
end
