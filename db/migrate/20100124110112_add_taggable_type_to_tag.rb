class AddTaggableTypeToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :taggable_type, :string
  end

  def self.down
    remove_column :tags, :taggable_type
  end
end
