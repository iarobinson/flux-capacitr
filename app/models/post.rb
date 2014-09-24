class Post < ActiveRecord::Base
  validates :author, :blog, :title, presence: true
  
  belongs_to(
    :blog,
    class_name: 'Blog',
    foreign_key: :blog_id,
    primary_key: :id
  )
  
  belongs_to(
    :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
  )
  
  has_many(
    :taggings,
    class_name: 'Tagging',
    foreign_key: :post_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :tags,
    through: :taggings,
    source: :tag
  )
end