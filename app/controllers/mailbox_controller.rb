class MailboxController < ApplicationController
  
  def index
    show
  end
  
  def show
    get_messages('Inbox')    
    @messages.each do |message|
      begin
        Message.find(message.message_id)
      rescue 
        message.update_attribute("message_id", nil)
      end
    end
    render :action => "show"
  end
  
  def trash
    debugger
    if(params[:box] == 'in' || @box == 'in')
      @box = 'in'
    else
      @box = 'out'
    end
    get_messages('Trash')
    render :action => "trash"
  end
  
  def delete
    destroy_message
    show
  end

  def recover
    recover_message
    @box = 'in'
    trash
  end
  
  def delete_complete
    @message = current_user.received_messages.find(params[:id])
    @message.destroy
    @box = 'in'
    trash
  end
  
  def recover_out
    recover_message_out
    @box = 'out'
    trash
  end
  
  def delete_complete_out
    @message = current_user.sent_messages.find(params[:id])
    @message.destroy
    trash
  end
  
  private
  
  def get_folder(folder)
    @folder = Folder.find_by_user_id_and_name(current_user.id, folder);
  end
  
  def get_messages(folder)
    @folder = Folder.find_by_user_id_and_name(current_user.id, folder);
    @messages = @folder.messages.all(:order => "created_at DESC").paginate :per_page => 5, :page => params[:page], :include => :message
    @out = current_user.sent_messages.find_all_by_folder_id(2, :order => "created_at DESC").paginate :per_page => 5, :page => params[:page], :include => :message
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
  
  def recover_message_out
    @message = current_user.sent_messages.find(params[:id])
    @message.update_attribute('folder_id', 1)
  end
  
end
