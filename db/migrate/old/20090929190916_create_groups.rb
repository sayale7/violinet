class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.integer :group_category_id
      t.string :description
      t.boolean :need_confrim
      t.boolean :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
