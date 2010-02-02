class CreateAssignNames < ActiveRecord::Migration
  def self.up
    create_table :assign_names do |t|
      t.integer :assign_id
      t.string :german_name
      t.string :english_name

      t.timestamps
    end
  end

  def self.down
    drop_table :assign_names
  end
end
