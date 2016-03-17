class RenameAvatarColumn < ActiveRecord::Migration
  def change
  	rename_column :users, :avatar, :profile_picture
  end
end
