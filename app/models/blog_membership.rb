class BlogMembership < ActiveRecord::Base
  validates :blog, :user, presence: true
  validates :blog, uniqueness: { scope: :user }
  validate :user_cannot_be_member_of_own_blog
  
  belongs_to :blog
  belongs_to :user
  
  private
  def user_cannot_be_member_of_own_blog
    if self.user == self.blog.owner
      errors.add("Users cannot be members of blogs they own.")
    end
  end
end