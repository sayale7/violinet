class AddNameAndLanguageToAssignName < ActiveRecord::Migration
  def self.up
    add_column :assign_names, :name, :string
    add_column :assign_names, :language, :string
  end

  def self.down
    remove_column :assign_names, :language
    remove_column :assign_names, :name
  end
end
