class User < ActiveRecord::Base
  validates :email, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  
  after_initialize :ensure_session_token
  
  has_many(
    :blogs,
    class_name: 'Blog',
    foreign_key: :owner_id,
    primary_key: :id
  )
  
  has_many(
    :posts,
    class_name: 'Post',
    foreign_key: :author_id,
    primary_key: :id
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