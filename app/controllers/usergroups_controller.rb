class UsergroupsController < ApplicationController
  
  def index
    render :action  => 'create'
  end
  
  def create
    group = Group.find(params[:group_id])
    usergroup = group.usergroups.build(:user_id => current_user.id)
    if usergroup.save
      flash[:notice] = t('group.attended')
    else
      flash[:error] = t('group.attend_error')
    end
    redirect_to group
  end
  
  def destroy
    group = Group.find(params[:group_id])
    usergroup = Usergroup.find_by_user_id(current_user.id)
    usergroup.destroy
    flash[:notice] = t('group.escaped')
    redirect_to group
  end
  
end
