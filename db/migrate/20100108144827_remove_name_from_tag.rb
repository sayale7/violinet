class RemoveNameFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :name
  end

  def self.down
    add_column :tags, :name, :string
  end
end
