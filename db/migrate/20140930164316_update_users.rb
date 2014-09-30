class UpdateUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, default: 'username'
    User.all.each do |user|
      user.update(username: user.email)
    end
    add_index :users, :username, unique: true
  end
end
