class CreateAssigns < ActiveRecord::Migration
  def self.up
    create_table :assigns do |t|
      t.integer :parent_id
      t.integer :ancestor_id
      t.integer :assignable_id
      t.string :assignable_type
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :assigns
  end
end
