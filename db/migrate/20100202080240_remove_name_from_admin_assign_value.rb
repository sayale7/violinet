class RemoveNameFromAdminAssignValue < ActiveRecord::Migration
  def self.up
    remove_column :admin_assign_values, :name
  end

  def self.down
    add_column :admin_assign_values, :name, :string
  end
end
