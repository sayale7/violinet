class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :spot
      t.string :color
      t.datetime :start_at
      t.datetime :end_at
      t.sting :description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :events
  end
end
