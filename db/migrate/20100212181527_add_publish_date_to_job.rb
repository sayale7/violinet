class AddPublishDateToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :puplish_date, :date
  end

  def self.down
    remove_column :jobs, :puplish_date
  end
end
