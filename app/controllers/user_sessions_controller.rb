class UserSessionsController < ApplicationController
  
  def new
    if !current_user
      @user_session = UserSession.new
    else
      redirect_to :controller => "users", :action => "show"
    end
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default root_url
  end
end