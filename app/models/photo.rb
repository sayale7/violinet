class Photo < ActiveRecord::Base
  has_attachment :content_type => :image,
                 :storage => :file_system,
                 :size => 200..500.kilobytes,
                 :resize_to => '600x600>',
                 :thumbnails => {:medium => '400x400', :thumb => '100x100>' }

  validates_as_attachment
  
  belongs_to :photo_album
  
  before_thumbnail_saved do |thumbnail|
    image = Photo.find_by_id(thumbnail.parent_id)
    thumbnail.photo_album_id = image.photo_album_id
  end
  
end
