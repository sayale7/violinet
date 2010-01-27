class AddUserIdAndDescriptionAndUrlToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :user_id, :integer
    add_column :events, :description, :text
    add_column :events, :url, :string
  end

  def self.down
    remove_column :events, :url
    remove_column :events, :description
    remove_column :events, :user_id
  end
end
