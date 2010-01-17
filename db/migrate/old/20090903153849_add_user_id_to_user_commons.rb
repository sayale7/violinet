class AddUserIdToUserCommons < ActiveRecord::Migration
  def self.up
    add_column :user_commons, :user_id, :integer, :default => false, :null => false
  end

  def self.down
    remove_column :user_commons, :user_id
  end
end
