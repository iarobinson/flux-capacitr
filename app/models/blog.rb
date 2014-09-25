class Blog < ActiveRecord::Base
  validates :owner, :title, :url, presence: true
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
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :followings,
    class_name: 'Following',
    foreign_key: :blog_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :followers,
    through: :followings,
    source: :follower
  )
end