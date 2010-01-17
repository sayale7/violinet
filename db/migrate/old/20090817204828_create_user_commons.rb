class CreateUserCommons < ActiveRecord::Migration
  def self.up
    create_table :user_commons do |t|
      t.string :gender
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :coordinates
      t.string :street
      t.string :city
      t.string :administrative_area
      t.string :district
      t.string :state
      t.integer :zip
      t.string :optional_address_attributes
      t.string :www
      t.string :phone
      t.timestamps
    end
  end

  def self.down
    drop_table :user_commons
  end
end
