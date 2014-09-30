class AddBlogDescriptions < ActiveRecord::Migration
  def change
    add_column :blogs, :description, :string
    add_index :blogs, :description
  end
end
