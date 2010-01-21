class Group < ActiveRecord::Base
  attr_accessible :name, :description, :user_id
  
  has_many :members, :through  => :usergroups
  belongs_to :owner, :class_name  => 'User', :foreign_key => "user_id"
end
