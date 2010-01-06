class MessagesController < ApplicationController
  
  def show
    @message = current_user.received_messages.find(params[:id])
    render :layout => "sent", :action => "show"
  end
  
  
  def read
    @message = MessageCopy.find(params[:id])
    @message.update_attribute("read", true)
    show
  end
  
  private
  
  def get_folder(folder)
    @folder = Folder.find_by_user_id_and_name(current_user.id, folder);
  end
  
  def get_messages(folder)
    @folder = Folder.find_by_user_id_and_name(current_user.id, folder);
    @messages = @folder.messages.all.paginate :per_page => 5, :page => params[:page], :include => :message, :order => "messages.created_at DESC"
  end
  
  def recover_message
    @message = current_user.received_messages.find(params[:id])
    get_folder('Inbox')
    @message.update_attributes(:deleted => false, :folder_id => @folder.id)
    get_messages('Inbox')
    get_messages('Trash')
  end
  
  def destroy_message
    @message = current_user.received_messages.find(params[:id])
    get_folder('Trash')
    @message.update_attributes(:deleted => true, :folder_id => @folder.id)
    get_messages('Trash')
    get_messages('Inbox')
  end
  
  
end