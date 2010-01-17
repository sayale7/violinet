class AllUsersController < ApplicationController

  #for recipient autocompletion for sending messages
  def index
    # @users = User.all
    # @recipients  = '['
    # unless @users.empty? 
    #   @users.each do |user|
    #     @recipients << {'name'  => user.login, 'id'  => user.id}.to_json.to_s.gsub(//\,"")
    #   end
    # end 
    # @recipients << ']'
    respond_to do |format|
      format.html
    end
  end
end
