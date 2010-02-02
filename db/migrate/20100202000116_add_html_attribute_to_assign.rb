class AddHtmlAttributeToAssign < ActiveRecord::Migration
  def self.up
    add_column :assigns, :html_attribute, :string
  end

  def self.down
    remove_column :assigns, :html_attribute
  end
end
