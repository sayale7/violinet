class Message < ActiveRecord::Base
  
  validates_presence_of :to, :message => "(Empfänger) Darf nicht leer sein"
  validates_presence_of :subject, :body
  
  belongs_to :author, :class_name => "User"
  
  has_many :message_copies
  
  before_create :prepare_copies 
  
  attr_accessor  :to # array of people to send to
  attr_accessible :subject, :body, :to
  
  
  def prepare_copies
    @users = User.find_all_by_id(to.uniq)
    self.folder_id = Folder.find_by_user_id_and_name(self.author_id, 'Inbox').id
    @users.each do |user|
      @folder = Folder.find_by_user_id_and_name("#{user.id}", 'Inbox');
      self.recipients = self.recipients.to_s + ', ' + user.login.to_s
      message_copies.build(:recipient_id => user.id, :folder_id => @folder.id, :subject => self.subject, :body => self.body, :author_id => self.author_id, :read => 0, :deleted => 0)
    end
  end
  
end