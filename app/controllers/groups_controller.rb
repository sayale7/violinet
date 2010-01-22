class GroupsController < ApplicationController
  
  def index
    if params[:user_id]
      @groups = User.find(params[:user_id]).usergroups
    else
      unless params[:user_id_for_search].nil?
        @groups = Group.name_like_or_description_like(params[:search])
        @groups = @groups & User.find(params[:user_id_for_search]).usergroups
      else
        @groups = Group.name_like_or_description_like_or_owner_login_like(params[:search])
        get_all_user_ids(user_commons_searchlogic).each do |user_id|
          @groups = @groups + Group.find_all_by_user_id(user_id)
        end
      end
    end
    @groups = @groups.uniq
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
  
  def mygroups
    @groups = Group.my_groups(current_user.id)
    if !params[:search].to_s.eql?("")
      @groups = @groups & Group.name_like_or_description_like(params[:search])
    end
    
    respond_to do |format|
      format.html # myblog.html.erb
      format.js
    end
  end

  def show
    @group = Group.find(params[:id])
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    @group.user_id = current_user.id
    if @group.save
      flash[:notice] = "Successfully created group."
      redirect_to @group
    else
      render :action => 'new'
    end
  end
  
  def edit
    @group = Group.find(params[:id])
    @not_in_group_tags = Tag.find_all_by_is_category(true) - @group.tags
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:notice] = "Successfully updated group."
      redirect_to @group
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "Successfully destroyed group."
    redirect_to groups_url
  end
  
  def add_tags
    @group = Group.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_or_create_by_tag_id_and_group_id(tag.id, @group.id)
    end
    @not_in_group_tags = Tag.all() - @group.tags
    respond_to do |format|
      format.html { redirect_to('/group/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  def remove_tags
    @group = Group.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_by_tag_id_and_group_id(tag.id, @group.id).destroy
    end
    @not_in_group_tags = Tag.all() - @group.tags
    respond_to do |format|
      format.html { redirect_to('/group/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  private
  
  def user_commons_searchlogic
    if params[:search].to_s.match(" ")
      split = params[:search].split(' ', 2)
      user_commons = UserCommon.all(:conditions  => "firstname LIKE '%#{split.first}%' and lastname LIKE '%#{split.second}%'")
      user_commons = user_commons + UserCommon.all(:conditions  => "firstname LIKE '%#{split.second}%' and lastname LIKE '%#{split.first}%'")
      return user_commons.uniq
    else
      return UserCommon.firstname_like_or_lastname_like(params[:search])
    end
  end
  
  def get_all_user_ids(user_commons)
    user_ids = Array.new
    user_commons.each do |user_common|
      user_ids.push(user_common.user_id)
    end
    return user_ids
  end
end
