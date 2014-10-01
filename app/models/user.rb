class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, :use => :slugged
  
  validates :email, :password_digest, :session_token, :username, presence: true
  validates :email, :session_token, :slug, :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validate :username_is_correctly_formatted
  
  after_initialize :ensure_session_token
  before_save :update_slug
  
  has_many :blogs, foreign_key: :owner_id, dependent: :destroy
  has_many :blog_memberships, dependent: :destroy
  has_many :followings, foreign_key: :follower_id, dependent: :destroy  
  has_many :followed_blogs, through: :followings, source: :blog  
  has_many :likes, dependent: :destroy  
  has_many :liked_posts, through: :likes, source: :post
  has_many :member_blogs, through: :blog_memberships, source: :blog
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  
  def self.find_by_credentials(email, password)
    user = self.find_by_email(email)
    return nil unless user
    
    if user.is_password?(password)
      user
    else
      nil
    end
  end
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def authored?(post)
    post.author == self
  end
  
  def can_like?(post)
    post.author != self
  end
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
  def feed_posts
    Post.where(blog_id: self.followed_blogs.ids)
        .order(created_at: :desc)
  end
  
  def is_following?(blog)
    self.followed_blogs.include?(blog)
  end
  
  def is_member?(blog)
    blog.members.include?(self)
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def owns?(blog)
    blog.owner == self
  end
  
  def password=(password)
    @password = password # why is this necessary?
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  private
  attr_reader :password
  
  def update_slug
    self.slug = self.username
  end
  
  def username_is_correctly_formatted
    if self.username.match(/ /)
      errors.add("Username cannot contain spaces.")
    end
  end
end