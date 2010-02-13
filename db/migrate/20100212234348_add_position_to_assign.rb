class AddPositionToAssign < ActiveRecord::Migration
  def self.up
    add_column :assigns, :position, :integer
  end

  def self.down
    remove_column :assigns, :position
  end
end
