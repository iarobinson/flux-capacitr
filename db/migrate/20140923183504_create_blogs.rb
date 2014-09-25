class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.string :slug
      
      t.timestamps
    end
    add_index :blogs, :owner_id
    add_index :blogs, :title
    add_index :blogs, :url, unique: true
    add_index :blogs, :slug, unique: true
  end
end
