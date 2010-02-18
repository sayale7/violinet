class PhotoAlbum < ActiveRecord::Base
  
  belongs_to :user
  has_many :photos, :dependent  => :destroy
  
  validates_presence_of :name
  
  validates_length_of :description, :maximum=>2000
  
end
