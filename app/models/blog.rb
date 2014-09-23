class Blog < ActiveRecord::Base
  validates :owner_id, :title, :url, presence: true
  validates :title, :url, uniqueness: true
  
  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :owner_id,
    primary_key: :id
  )
  
  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: :blog_id,
    primary_key: :id
  )
end