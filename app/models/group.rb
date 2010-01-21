class Group < ActiveRecord::Base
  attr_accessible :name, :description, :user_id, :photo
  
  named_scope :my_groups, lambda { |argument| { :conditions => ["user_id = ?" , argument] } }
  
  has_many :usergroups, :dependent  => :destroy
  has_many :members, :through  => :usergroups, :source  => :user
  
  belongs_to :owner, :class_name  => 'User', :foreign_key => "user_id"
  
  has_attached_file :photo, :styles => { :small => "100x100#", :medium  => '250x250>' },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  # validates_attachment_presence :photo
  # validates_attachment_size :photo, :less_than => 0.5.megabytes
  # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']
end
