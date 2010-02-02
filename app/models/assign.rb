class Assign < ActiveRecord::Base
  
  acts_as_tree
  
  belongs_to :assignings
  
  has_many :assign_names, :dependent => :destroy
  has_many :admin_assign_values, :dependent  => :destroy
  accepts_nested_attributes_for :admin_assign_values, :allow_destroy => true
  has_many :user_assign_values, :dependent  => :destroy
  
  attr_writer :german_name
  attr_writer :english_name
  
  after_save :assign_german_assign_name
  after_save :assign_english_assign_name
  
  
  def german_name
    unless self.assign_names.find_by_language('de').nil?
      self.assign_names.find_by_language('de').name
    end
  end
  
  def english_name
    unless self.assign_names.find_by_language('en').nil?
      self.assign_names.find_by_language('en').name
    end
  end

  private
  
  def assign_german_assign_name 
    unless AssignName.find_by_assign_id_and_language(self.id, 'de').nil?
      assign_name = AssignName.find_by_assign_id_and_language(self.id, 'de')
      assign_name.update_attributes(:language => 'de', :name => @german_name, :assign_id => self.id)
      assign_name.save
    else
      AssignName.find_or_create_by_language_and_name_and_assign_id('de', @german_name, self.id)
    end
  end

  def assign_english_assign_name
    unless AssignName.find_by_assign_id_and_language(self.id, 'en').nil?
      assign_name = AssignName.find_by_assign_id_and_language(self.id, 'en')
      assign_name.update_attributes(:language => 'en', :name => @english_name, :assign_id => self.id)
      assign_name.save
    else
      AssignName.find_or_create_by_language_and_name_and_assign_id('en', @english_name, self.id)
    end
  end
  
end
