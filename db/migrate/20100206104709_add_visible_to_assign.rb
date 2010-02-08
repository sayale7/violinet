class AddVisibleToAssign < ActiveRecord::Migration
  def self.up
    add_column :assigns, :visible, :boolean
  end

  def self.down
    remove_column :assigns, :visible
  end
end
