class CreateProfileEntries < ActiveRecord::Migration
  def self.up
    create_table :profile_entries do |t|
      t.text :body
      t.string :author
      t.string :author_id
      t.integer :user_id
      t.timestamps
    end
  end
  
  
  def self.down
    drop_table :profile_entries
  end
end
