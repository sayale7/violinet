class RemoveEnglishNameAndGermanNameFromAssignName < ActiveRecord::Migration
  def self.up
    remove_column :assign_names, :english_name
    remove_column :assign_names, :german_name
  end

  def self.down
    add_column :assign_names, :german_name, :string
    add_column :assign_names, :english_name, :string
  end
end
