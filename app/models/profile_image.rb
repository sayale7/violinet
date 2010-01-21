class ProfileImage < ActiveRecord::Base
  
  has_attachment :content_type => :image, 
  :storage => :file_system, 
  :max_size => 500.kilobytes,
  :resize_to => '500x500>',
  :thumbnails => { :thumb => '100x100!', :small  => '150x150>' },
  :processor  => :MiniMagick
  
  validates_as_attachment
  
  belongs_to :user
  
  #  attr_accessible :user_id
  
  #The block will be executed just before the thumbnail is saved.
  #We need to set extra values in the thumbnail class as
  #we want it to have the same extra attribute values as the original image
  #except for the default flag that is always set to false
  before_thumbnail_saved do |thumbnail|
    image = ProfileImage.find_by_id(thumbnail.parent_id)
    thumbnail.user_id = image.user_id
    
  end
  
end