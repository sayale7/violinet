class CreateTagRelationships < ActiveRecord::Migration
  def self.up
    create_table :tag_relationships do |t|
      t.integer :parent_id
      t.integer :child_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tag_relationships
  end
end
