class Blog < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url, :use => :slugged

  validates :owner, :title, :url, presence: true
  validates :title, :url, :slug, uniqueness: true

  before_save :update_slug

  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many :blog_memberships, dependent: :destroy
  has_many :members, through: :blog_memberships, source: :user
  has_many(
    :posts,
    -> { order 'created_at DESC' },
    inverse_of: :blog,
    dependent: :destroy
  )
  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings, source: :follower

  private

  def update_slug
    self.slug = self.url
  end
end
