class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token
  
  has_many(
    :blogs,
    class_name: 'Blog',
    foreign_key: :owner_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: :author_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :followings,
    class_name: 'Following',
    foreign_key: :follower_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :followed_blogs,
    through: :followings,
    source: :blog
  )
  
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
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
  def feed_posts(limit, max_created_at)
    posts = Post.where(blog_id: self.followed_blogs.ids)
                .where('created_at <= ?', max_created_at)
                .limit(limit)
                .order(created_at: :desc)
  end
  
  def is_following?(blog)
    self.followed_blogs.include?(blog)
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
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
end