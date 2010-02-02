class CreateAdminAssignValueNames < ActiveRecord::Migration
  def self.up
    create_table :admin_assign_value_names do |t|
      t.integer :admin_assign_value_id
      t.string :name
      t.string :language

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_assign_value_names
  end
end
