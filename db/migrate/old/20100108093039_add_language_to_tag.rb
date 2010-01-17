class AddLanguageToTag < ActiveRecord::Migration
  def self.up
    add_column :tags, :language, :string
  end

  def self.down
    remove_column :tags, :language
  end
end
