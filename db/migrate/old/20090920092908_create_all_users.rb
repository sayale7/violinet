class CreateAllUsers < ActiveRecord::Migration
  def self.up
    create_table :all_users do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :all_users
  end
end
