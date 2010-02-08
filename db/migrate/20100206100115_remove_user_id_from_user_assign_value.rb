class RemoveUserIdFromUserAssignValue < ActiveRecord::Migration
  def self.up
    remove_column :user_assign_values, :user_id
  end

  def self.down
    add_column :user_assign_values, :user_id, :integer
  end
end
