class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :german_name
      t.string :english_name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :categories
  end
end
