class Post < ActiveRecord::Base
  validates :author, :blog, :title, presence: true
  
  paginates_per 5
  
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
  
  has_many :likes, dependent: :destroy
  
  has_many :users_liked_by, through: :likes, source: :user
  
  def self.parse_tags(tag_string)
    tag_array = tag_string.split(/[#,]/)
    tag_array.map! { |el| el.strip }
    tag_array.reject! { |el| el.empty? }
    tag_array.uniq!
    
    tag_array.map { |el| Tag.find_or_create_by(label: el) }
  end
  
  def assign_tags(tag_string)
    self.tags = self.class.parse_tags(tag_string)
  end
  
  def is_liked_by?(user)
    self.users_liked_by.include?(user)
  end
end