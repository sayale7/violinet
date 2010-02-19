class RemoveParentIdFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :parent_id
  end

  def self.down
    add_column :tags, :parent_id, :integer
  end
end
