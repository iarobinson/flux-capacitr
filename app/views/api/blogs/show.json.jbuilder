json.partial! 'api/blogs/blog', blog: @blog

json.posts @posts do |post|
  json.partial! 'api/posts/post', post: post
end

json.show_controls logged_in?

json.page params[:page] || 1
json.total_pages @posts.total_pages
