class RemoveNameFromAssign < ActiveRecord::Migration
  def self.up
    remove_column :assigns, :name
  end

  def self.down
    add_column :assigns, :name, :string
  end
end
