class User < ActiveRecord::Base
  
  has_one :user_common
  has_one :profile_image
  has_many :posts
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders, :dependent => :destroy
  has_many :photo_albums
  has_many :comments, :as => :commentable
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :groups, :through  => :usergroups
  
  named_scope :from_user_common, :include => :user_common, :conditions => { 'user_common.hidden' => false }
  
  before_create :build_inbox
  before_create :build_trash
  
  acts_as_authorization_subject
  
  acts_as_authentic do |c|
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
  end
  
  attr_accessible :to, :login, :email, :password, :password_confirmation
  
  def active?
    active
  end
  
  def inbox
    folders.find_by_name("Inbox")
  end
  
  def build_inbox
    folders.build(:name => "Inbox")
  end
  
  def trash
    folders.find_by_name("Trash")
  end
  
  def build_trash
    folders.build(:name => "Trash")
  end
  
  def self.find_by_login_or_email(login)
    User.find_by_login(login) || User.find_by_email(login)
  end
  
  # ...
  # now let's define a couple of methods in the user model. The first
  # will take care of setting any data that you want to happen at signup
  # (aka before activation)
  # def signup!(params)
  #   self.login = params[:user][:login]
  #   self.email = params[:user][:email]
  #   save_without_session_maintenance
  # end
  
  # the second will take care of setting any data that you want to happen
  # at activation. at the very least this will be setting active to true
  # and setting a pass, openid, or both.
  # def activate!(params)
  #   self.active = true
  #   self.password = params[:user][:password]
  #   self.password_confirmation = params[:user][:password_confirmation]
  #   save
  # end
  
  # def deliver_activation_instructions!
  #   reset_perishable_token!
  #   Notifier.deliver_activation_instructions(self)
  # end
  # 
  # def deliver_activation_confirmation!
  #   reset_perishable_token!
  #   Notifier.deliver_activation_confirmation(self)
  # end
  
  # we need to make sure that either a password or openid gets set
  # when the user activates his account
  def has_no_credentials?
    self.crypted_password.blank?
  end
  # 
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end 
  
  
  
end
