class CreateAdminAssignValues < ActiveRecord::Migration
  def self.up
    create_table :admin_assign_values do |t|
      t.integer :assign_id
      t.integer :parent_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_assign_values
  end
end
