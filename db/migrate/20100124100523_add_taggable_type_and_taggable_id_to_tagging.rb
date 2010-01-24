class AddTaggableTypeAndTaggableIdToTagging < ActiveRecord::Migration
  def self.up
    add_column :taggings, :taggable_type, :string
    add_column :taggings, :taggable_id, :integer
  end

  def self.down
    remove_column :taggings, :taggable_id
    remove_column :taggings, :taggable_type
  end
end
