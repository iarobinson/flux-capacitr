class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, :use => :slugged
  
  validates :owner, :title, :url, presence: true
  validates :title, :url, uniqueness: true
  
  before_save :update_slug
  
  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many :posts, -> { order 'created_at DESC' }, dependent: :destroy
  
  # has_many(
  #   :posts,
  #   class_name: 'Post',
  #   foreign_key: :blog_id,
  #   primary_key: :id,
  #   order: 'created_at DESC',
  #   dependent: :destroy
  # )
  
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
  
  def update_slug
    self.slug = self.url
  end
end