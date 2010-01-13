class AddRecipientsToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :recipients, :string
  end

  def self.down
    remove_column :messages, :recipients
  end
end
