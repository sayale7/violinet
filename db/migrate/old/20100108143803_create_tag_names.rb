class CreateTagNames < ActiveRecord::Migration
  def self.up
    create_table :tag_names do |t|
      t.string :name
      t.string :language
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tag_names
  end
end
