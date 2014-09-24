class Tagging < ActiveRecord::Base
  validates :post_id, :tag_id, presence: true
  validates :post_id, uniqueness: { scope: :tag_id }
  
  belongs_to(
    :post,
    class_name: 'Post',
    foreign_key: :post_id,
    primary_key: :id
  )
  
  belongs_to(
    :tag,
    class_name: 'Tag',
    foreign_key: :tag_id,
    primary_key: :id
  )
end