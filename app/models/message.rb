class Message < ActiveRecord::Base
  
  validates_presence_of :to, :message => "(Empfänger) Darf nicht leer sein"
  validates_presence_of :subject, :body
  
  belongs_to :author, :class_name => "User"
  
  has_many :message_copies
  has_many :recipients
  
  before_create :prepare_copies, :prepare_recipients
  
  attr_accessor  :to # array of people to send to
  attr_accessible :subject, :body, :to
  
  
  def prepare_copies
#    debugger
    #get_users_from_collection(to)
    @ids = to.uniq
    @ids.each do |touser|
      get_users(touser)
      @users.each do |user|
        @folder = Folder.find_by_user_id_and_name("#{user.id}", 'Inbox');
        self.folder_id = @folder.id
        message_copies.build(:recipient_id => user.id, :folder_id => @folder.id, :subject => self.subject, :body => self.body, :author_id => user.id, :read => 0, :deleted => 0)
      end
    end
  end
  
  def prepare_recipients
    @ids.each do |touser|
      get_users(touser)
      @users.each do |user|
        recipients.build(:user_id => user.id);
      end
    end
  end
  
  private
  def get_users(touser)
    @users = User.find_all_by_id(touser)
  end
  
#  def get_users_from_collection(tousers)
#    if !tousers.include?("alle@dasjetzt.at") && !tousers.include?("alleausserjoe@dasjetzt.at")
#      @emails = tousers.uniq
#    end
#  end
end