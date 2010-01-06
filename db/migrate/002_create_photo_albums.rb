class CreatePhotoAlbums < ActiveRecord::Migration
  def self.up
    create_table :photo_albums do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
