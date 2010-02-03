class UserCommonsController < ApplicationController
  
  def index
    @user_commons = UserCommon.all
  end
  
  def show
    @user_common = UserCommon.find(params[:id])
  end
  
  def edit
    @user_common = UserCommon.find_by_user_id(params[:id])
    unauthorized! if cannot? :manage, @user_common
    render :layout => 'users'
  end
  
  def update
    @user_common = UserCommon.find(params[:id])
    unauthorized! if cannot? :manage, @user_common
    if @user_common.update_attributes(params[:user_common])
      flash[:notice] = t('common.updated')
      redirect_to '/users/' + current_user.id.to_s
    else
      render :action => 'edit'
    end
  end
  
end
