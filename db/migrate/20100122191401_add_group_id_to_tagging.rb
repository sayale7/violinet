class AddGroupIdToTagging < ActiveRecord::Migration
  def self.up
    add_column :taggings, :group_id, :integer
  end

  def self.down
    remove_column :taggings, :group_id
  end
end
