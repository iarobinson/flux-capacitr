class Following < ActiveRecord::Base
  validates :follower_id, :blog_id, presence: true
  validates :follower_id, uniqueness: { scope: :blog_id }
  
  belongs_to(
    :blog,
    class_name: 'Blog',
    foreign_key: :blog_id,
    primary_key: :id
  )
  
  belongs_to(
    :follower,
    class_name: 'User',
    foreign_key: :follower_id,
    primary_key: :id
  )
end