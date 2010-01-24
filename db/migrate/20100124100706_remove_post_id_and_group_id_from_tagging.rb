class RemovePostIdAndGroupIdFromTagging < ActiveRecord::Migration
  def self.up
    remove_column :taggings, :post_id
    remove_column :taggings, :group_id
  end

  def self.down
    add_column :taggings, :group_id, :integer
    add_column :taggings, :post_id, :integer
  end
end
