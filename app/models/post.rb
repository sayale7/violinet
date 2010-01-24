class Post < ActiveRecord::Base
  
  named_scope :my_posts, lambda { |argument| { :conditions => ["user_id = ?" , argument] } }
  
  named_scope :from_date, lambda { |*args| {:conditions => ["created_at >= ? and created_at <= ?", args.first, args.last + 1.day] } }
  
  has_many :taggings, :as  => :taggable, :dependent => :destroy
  
  has_many :tags, :through => :taggings
  
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  belongs_to :user
  
  validates_presence_of :title, :body
  
  
end
#(Time.now - 60.day).strftime("%Y-%m-%d %H:%M:%S")