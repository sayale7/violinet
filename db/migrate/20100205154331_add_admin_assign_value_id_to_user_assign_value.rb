class AddAdminAssignValueIdToUserAssignValue < ActiveRecord::Migration
  def self.up
    add_column :user_assign_values, :admin_assign_value_id, :integer
  end

  def self.down
    remove_column :user_assign_values, :admin_assign_value_id
  end
end
