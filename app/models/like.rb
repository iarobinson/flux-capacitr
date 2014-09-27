class Like < ActiveRecord::Base
  validates :user, :post, presence: true
  validates :user, uniqueness: { scope: :post_id }
  validate :user_cannot_like_own_post
  
  belongs_to :user
  belongs_to :post
  
  def user_cannot_like_own_post
    if self.user == self.post.author
      errors.add("You cannot like your own post")
    end
  end
end