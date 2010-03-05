class Flat < ActiveRecord::Base
  attr_accessible :user_id, :title, :address
  
  has_many :user_assign_values, :foreign_key => "assignable_id", :dependent  => :destroy
  has_many :user_assigns, :through  => :user_assign_values  
  
  has_many :taggings, :as  => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  has_many :photos, :foreign_key => 'photo_container_id', :dependent  => :destroy
  
  def flat_assigns
    Assign.scoped(:conditions => { :assignable_type  => 'Flat' }, :order => 'position')
  end
  
end
