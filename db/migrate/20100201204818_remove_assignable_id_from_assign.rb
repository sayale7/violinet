class RemoveAssignableIdFromAssign < ActiveRecord::Migration
  def self.up
    remove_column :assigns, :assignable_id
  end

  def self.down
    add_column :assigns, :assignable_id, :integer
  end
end
