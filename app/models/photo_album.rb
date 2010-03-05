class PhotoAlbum < ActiveRecord::Base
  
  belongs_to :user
  has_many :photos, :foreign_key => 'photo_container_id', :dependent  => :destroy
  
  validates_presence_of :name
  
  validates_length_of :description, :maximum=>2000
  
end
