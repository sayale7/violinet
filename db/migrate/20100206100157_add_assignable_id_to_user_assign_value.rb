class AddAssignableIdToUserAssignValue < ActiveRecord::Migration
  def self.up
    add_column :user_assign_values, :assignable_id, :integer
  end

  def self.down
    remove_column :user_assign_values, :assignable_id
  end
end
