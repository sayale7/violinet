class UserCommonsController < ApplicationController
  
  access_control do
    allow logged_in, :to => [:edit, :update]
  end
  
  def index
    @user_commons = UserCommon.all
  end
  
  def show
    @user_common = UserCommon.find(params[:id])
  end
  
  def new
    @user_common = UserCommon.new
  end
  
  def create
    @user_common = UserCommon.new(params[:user_common])
    if @user_common.save
      flash[:notice] = "Successfully created user common."
      redirect_to @user_common
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user_common = UserCommon.find_by_user_id(params[:id])
    render :layout => 'users'
  end
  
  def update
    @user_common = UserCommon.find(params[:id])
    if @user_common.update_attributes(params[:user_common])
      flash[:notice] = "Successfully updated user common."
      redirect_to account_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user_common = UserCommon.find(params[:id])
    @user_common.destroy
    flash[:notice] = "Successfully destroyed user common."
    redirect_to user_commons_url
  end
end
