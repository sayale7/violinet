class User < ActiveRecord::Base
  
  has_one :user_common, :dependent  => :destroy
  has_one :profile_image, :dependent  => :destroy
  has_many :posts, :dependent  => :destroy
  has_many :sent_messages, :class_name => "Message", :foreign_key => "author_id"
  has_many :received_messages, :class_name => "MessageCopy", :foreign_key => "recipient_id"
  has_many :folders, :dependent => :destroy
  has_many :photo_albums, :dependent  => :destroy
  has_many :comments, :as => :commentable, :dependent  => :destroy
  has_many :friendships, :dependent  => :destroy
  has_many :friends, :through => :friendships, :dependent  => :destroy
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id", :dependent  => :destroy
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :dependent  => :destroy
  
  has_many :roles_users, :dependent  => :destroy
  has_many :roles, :through  => :roles_users, :dependent  => :destroy
  
  
  has_many :own_groups, :class_name => 'Group', :dependent  => :destroy
  
  has_many :usergroups, :dependent  => :destroy
  has_many :groups, :through  => :usergroups, :dependent  => :destroy
  
  has_many :events
  
  named_scope :from_user_common, :include => :user_common, :conditions => { 'user_common.hidden' => false }
  
  before_create :build_inbox
  before_create :build_trash
  
  before_destroy :find_comments
  
  
  acts_as_authentic do |c|
    c.validates_length_of_password_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
    c.validates_length_of_password_confirmation_field_options = {:on => :update, :minimum => 4, :if => :has_no_credentials?}
  end
  
  attr_accessible :to, :login, :email, :password, :password_confirmation
  
  def role?(role)
    roles.each do |_role|
      if _role.name.to_s.eql?(role.to_s)
        return true
      end
    end
    return false
  end
  
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
  
  private
  
  def find_comments
    comments = Comment.find_all_by_author_id(self.id)
    comments.each do |comment|
      comment.destroy
    end
  end
  
  
  
end
