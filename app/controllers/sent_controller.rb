class SentController < ApplicationController
  
  def index
    @messages = current_user.sent_messages.find_all_by_folder_id(current_user.folders.find_by_name("Inbox").id, :order => "created_at DESC").paginate :per_page => 5, :page => params[:page]
  end
  
  def show
    @message = current_user.sent_messages.find(params[:id])
  end
  
  def new
    @message = current_user.sent_messages.build
    get_users
    if params[:user] != nil
      @user = User.find(params[:user])
      @users_hash = @users_hash.merge({ @user.id =>  true})
    end
  end
  
  def create
    @message = current_user.sent_messages.build(params[:message])
    if @message.save
      recived_messages = MessageCopy.find_all_by_message_id(@message.id)
      user_for_id = recived_messages[0]
      user_id = user_for_id.recipient_id
      users = User.find_all_by_id(user_id)
      users.each do |user|
        if user.mail
          MessageMailer.deliver_recived(@message, user)
        end
      end
      flash[:notice] = "Nachricht geschickt."
      redirect_to('/sent')
    else
      get_users
      render :action => "new"
    end
  end
  
  def create_from_a_user
    @message = current_user.sent_messages.build(params[:message])
    if @message.save
      recived_messages = MessageCopy.find_all_by_message_id(@message.id)
      user_for_id = recived_messages[0]
      user_id = user_for_id.recipient_id
      users = User.find_all_by_id(user_id)
      users.each do |user|
        if user.mail
          MessageMailer.deliver_recived(@message, user)
        end
      end
      flash[:notice] = "Nachricht geschickt."
      redirect_to "/users/" + params[:id]
    else
    end
  end
  
  def delete
    @message = Message.find(params[:id])
    @message.update_attribute('folder_id', current_user.folders.find_by_name("Trash").id)
    index
    render :action => 'index'
  end
  
  private
  
  def get_users
    @users = User.all()
    @users_hash = Hash.new
    @users.each do |user|
      @users_hash = @users_hash.merge({ user.id =>  false})
    end
  end
  
end
