json.blogs @blogs do |blog|
  json.partial! 'api/blogs/nameplate', blog: blog
end

json.page params[:page] || 1
json.total_pages @blogs.total_pages