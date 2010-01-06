class AllUsersController < ApplicationController
  
  #for recipient autocompletion for sending messages
  def index
    respond_to do |format|
      format.html
    end
  end
end
