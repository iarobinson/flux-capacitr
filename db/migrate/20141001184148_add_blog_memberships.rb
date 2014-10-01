class AddBlogMemberships < ActiveRecord::Migration
  def change
    create_table :blog_memberships do |t|
      t.integer :blog_id, null: false
      t.integer :user_id, null: false
      
      t.timestamps
    end
    add_index :blog_memberships, :blog_id
    add_index :blog_memberships, :user_id
    add_index :blog_memberships, [:blog_id, :user_id], unique: true
  end
end
