class RemoveIsCategoryFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :is_category
  end

  def self.down
    add_column :tags, :is_category, :boolean
  end
end
