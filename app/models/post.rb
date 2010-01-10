class Post < ActiveRecord::Base
  
  has_many :taggings, :dependent => :destroy
  
  has_many :tags, :through => :taggings
  
  has_many :comments, :as => :commentable #:dependent => :destroy
  
  belongs_to :user
  
  validates_presence_of :title, :body
end
