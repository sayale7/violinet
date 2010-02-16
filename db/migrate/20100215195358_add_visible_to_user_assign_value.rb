class AddVisibleToUserAssignValue < ActiveRecord::Migration
  def self.up
    add_column :user_assign_values, :visible, :boolean
  end

  def self.down
    remove_column :user_assign_values, :visible
  end
end
