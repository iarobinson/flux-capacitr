json.(post,
      :id,
      :author_id,
      :blog_id,
      :title,
      :body,
      :created_at,
      :updated_at)

json.is_author (current_user == post.author)

json.blog_url post.blog.url

json.tags post.tags.map { |tag| tag.label }

json.time_ago "#{time_ago_in_words(post.created_at)} ago"

json.url "#posts/#{post.id}"