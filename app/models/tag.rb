class Tag < ActiveRecord::Base
  
  acts_as_tree
  
  has_many :taggings, :dependent => :destroy

  has_many :tag_names, :dependent => :destroy
  
  attr_writer :german_name
  attr_writer :english_name
  
  
  after_save :assign_german_tag_name
  after_save :assign_english_tag_name
  
  
  def german_name
    unless self.tag_names.find_by_language('de').nil?
      self.tag_names.find_by_language('de').name
    end
  end
  
  def english_name
    unless self.tag_names.find_by_language('en').nil?
      self.tag_names.find_by_language('en').name
    end
  end

  
  private
  
  def assign_german_tag_name
    unless TagName.find_by_tag_id_and_language(self.id, 'de').nil?
      tag_name = TagName.find_by_tag_id_and_language(self.id, 'de')
      tag_name.update_attributes(:language => 'de', :name => @german_name, :tag_id => self.id)
      tag_name.save
    else
      TagName.create(:language => 'de', :name => @german_name, :tag_id => self.id)
    end
  end

  def assign_english_tag_name
    unless TagName.find_by_tag_id_and_language(self.id, 'en').nil?
      tag_name = TagName.find_by_tag_id_and_language(self.id, 'en')
      tag_name.update_attributes(:language => 'en', :name => @english_name, :tag_id => self.id)
      tag_name.save
    else
      TagName.find_or_create_by_language_and_name_and_tag_id('en', @english_name, self.id)
    end
  end

end
