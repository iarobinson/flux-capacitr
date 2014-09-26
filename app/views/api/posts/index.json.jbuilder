json.posts @posts do |post|
  json.partial! 'api/posts/post', post: post
end

json.page params[:page] || 1
json.total_pages @posts.total_pages