class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.integer :owner_id, null: false
      t.string :title, null: false
      t.string :url, null: false
      
      t.timestamps
    end
    add_index :blogs, :owner_id
    add_index :blogs, :title, unique: true
    add_index :blogs, :url, unique: true
  end
end
