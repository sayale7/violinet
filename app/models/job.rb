class Job < ActiveRecord::Base
  
  attr_accessible :active, :title
  
  has_many :user_assign_values, :foreign_key => "assignable_id", :dependent  => :destroy
  has_many :user_assigns, :through  => :user_assign_values  
  
  has_many :taggings, :as  => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  def job_assigns
    Assign.scoped(:conditions => { :assignable_type  => 'Job' })
  end
  
end
