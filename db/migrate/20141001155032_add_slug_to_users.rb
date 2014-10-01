class AddSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true
    User.all.each do |user|
      user.slug = user.username
    end
  end
end
