class PasswordResetsController < ApplicationController
  
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user
  
  def new
    render
  end
  
  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = t("user.passwort_reset_instructions")
      redirect_to root_url
    else
      flash[:notice] = t("user.passwort_reset_instructions_no_email")
      render :action => :new
    end
  end
  
  def edit
    render
  end
  
  def update
    begin
      @user = User.find(params[:id])
      @user.update_attributes(params[:user]) 
        flash[:notice] = t("common.updated")  
        redirect_to user_path(@user)
    rescue Exception => e
      flash[:notice] =
      render :action => :edit
    end
  end
  
  private
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:reset_code])
       unless @user
         flash[:notice] = "We're sorry, but we could not locate your account." +
         "If you are having issues try copying and pasting the URL " +
         "from your email into your browser or restarting the " +
         "reset password process."
         redirect_to root_url
       end
  end
end