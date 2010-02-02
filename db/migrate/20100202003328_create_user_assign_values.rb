class CreateUserAssignValues < ActiveRecord::Migration
  def self.up
    create_table :user_assign_values do |t|
      t.integer :user_id
      t.integer :assign_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :user_assign_values
  end
end
