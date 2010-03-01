class AddPhotoContainerTypeToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :photo_container_type, :string
  end

  def self.down
    remove_column :photos, :photo_container_type
  end
end
