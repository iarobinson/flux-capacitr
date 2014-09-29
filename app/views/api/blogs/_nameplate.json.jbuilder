json.(blog, :id, :title, :url, :owner_id, :created_at, :updated_at)

json.full_url "#{request.domain}/#{blog.url}"

json.num_followers blog.followers.count