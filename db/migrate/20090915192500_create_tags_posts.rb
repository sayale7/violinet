class CreateTagsPosts < ActiveRecord::Migration
  def self.up
    create_table :tag_posts do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_posts
  end
end
