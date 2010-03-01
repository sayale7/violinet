class CreateFlats < ActiveRecord::Migration
  def self.up
    create_table :flats do |t|
      t.integer :user_id
      t.string :title
      t.string :address
      t.timestamps
    end
  end
  
  def self.down
    drop_table :flats
  end
end
