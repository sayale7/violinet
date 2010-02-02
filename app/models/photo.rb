class Photo < ActiveRecord::Base
  
  belongs_to :photo_album

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :size => 1 .. 5000.kilobytes,
                 :resize_to => '500x500>',
                 :thumbnails => {:thumb => '75x75!', :medium  => '400x320!' },
                 :processor => :MiniMagick
                 
  validates_as_attachment
  
  
  
  before_thumbnail_saved do |thumbnail|
    image = Photo.find_by_id(thumbnail.parent_id)
    thumbnail.photo_album_id = image.photo_album_id
  end
  
  
end
