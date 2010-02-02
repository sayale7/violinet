class AdminAssignValue < ActiveRecord::Base
  
  belongs_to :assign

  has_many :admin_assign_value_names, :dependent => :destroy

  attr_writer :german_name
  attr_writer :english_name
  
  after_save :assign_german_admin_assign_value_name
  after_save :assign_english_admin_assign_value_name
  
  
  def german_name
    unless self.admin_assign_value_names.find_by_language('de').nil?
      self.admin_assign_value_names.find_by_language('de').name
    end
  end
  
  def english_name
    unless self.admin_assign_value_names.find_by_language('en').nil?
      self.admin_assign_value_names.find_by_language('en').name
    end
  end

  private
  
  def assign_german_admin_assign_value_name
    unless AdminAssignValueName.find_by_admin_assign_value_id_and_language(self.id, 'de').nil?
      admin_assign_value_name = AdminAssignValueName.find_by_admin_assign_value_id_and_language(self.id, 'de')
      admin_assign_value_name.update_attributes(:language => 'de', :name => @german_name, :admin_assign_value_id => self.id)
      admin_assign_value_name.save
    else
      AdminAssignValueName.find_or_create_by_language_and_name_and_admin_assign_value_id('de', @german_name, self.id)
    end
  end

  def assign_english_admin_assign_value_name
    unless AdminAssignValueName.find_by_admin_assign_value_id_and_language(self.id, 'en').nil?
      admin_assign_value_name = AdminAssignValueName.find_by_admin_assign_value_id_and_language(self.id, 'en')
      admin_assign_value_name.update_attributes(:language => 'en', :name => @english_name, :admin_assign_value_id => self.id)
      admin_assign_value_name.save
    else
      AdminAssignValueName.find_or_create_by_language_and_name_and_admin_assign_value_id('en', @english_name, self.id)
    end
  end
end
