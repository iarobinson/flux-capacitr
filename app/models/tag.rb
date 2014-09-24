class Tag < ActiveRecord::Base
  validates :label, presence: true, uniqueness: true
  
  has_many(
    :taggings,
    class_name: 'Tagging',
    foreign_key: :tag_id,
    primary_key: :id,
    dependent: :destroy
  )
end