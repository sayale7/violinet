class AddUserIdToProfileImage < ActiveRecord::Migration
def self.up
    add_column :profile_images, :user_id, :integer, :default => false, :null => false
  end

  def self.down
    remove_column :profile_images, :user_id
  end
end
