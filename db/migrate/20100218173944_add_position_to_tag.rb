class AddPositionToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :position, :integer
  end

  def self.down
    remove_column :tags, :position
  end
end
