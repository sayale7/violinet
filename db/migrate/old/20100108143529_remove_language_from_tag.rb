class RemoveLanguageFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :language
  end

  def self.down
    add_column :tags, :language, :string
  end
end
