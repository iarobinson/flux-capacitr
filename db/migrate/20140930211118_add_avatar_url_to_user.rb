class AddAvatarUrlToUser < ActiveRecord::Migration
  def change
    add_column :users,
               :avatar_url,
               :string,
               null: false,
               default: 'https://www.filepicker.io/api/file/3JsiRaA0QcW2T7vGGRcI'
  end
end