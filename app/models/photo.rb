class Photo < ActiveRecord::Base
  
  belongs_to :photo_album

  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :size => 1 .. 5000.kilobytes,
                 :thumbnails => {:thumb => '75x75!', :medium  => '400x320!', :large => '500x500>', :max  => '1000x1000>' },
                 :processor => :MiniMagick
                 
  validates_as_attachment
  
  before_thumbnail_saved do |thumbnail|
    image = Photo.find_by_id(thumbnail.parent_id)
    thumbnail.photo_album_id = image.photo_album_id
  end
  
  
end
