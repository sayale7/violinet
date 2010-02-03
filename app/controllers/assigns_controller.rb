class AssignsController < ApplicationController
  
  def index
    unless params[:assignable_type].nil?
      @assignable_type =  params[:assignable_type]
    end
    @_assigns = Assign.find_all_by_assignable_type(@assignable_type)
    render :layout  => '/layouts/users'
  end
  
  def show
    @assign = Assign.find(params[:id])
    render :layout  => '/layouts/users'
  end
  
  def new
    @assign = Assign.new
    @assign.html_attribute = 'text_field'
    @assignable_type =  params[:assignable_type]
    render :layout  => '/layouts/users'
  end
  
  def create
    @assign = Assign.new(params[:assign])
    @assignable_type = @assign.assignable_type
    if @assign.save
      redirect_to assigns_path(:assignable_type  => @assignable_type)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @assign = Assign.find(params[:id]) 
    @assignable_type = @assign.assignable_type
    render :layout  => '/layouts/users'
  end
  
  def update
    @assign = Assign.find(params[:id])
    @assignable_type = @assign.assignable_type
    test_assign = Assign.new
    test_assign.parent_id = params[:assign][:parent_id]
    unless params[:assign][:parent_id].eql?(@assign.id.to_s) || (test_assign.parent.parent_id != nil)
      if @assign.update_attributes(params[:assign])
        redirect_to edit_assign_path(:assign  => @assign, :assignable_type  => @assignable_type)
      else
        flash[:error] = "verschachtelung zu tief oder falsch zugewiesen"
        redirect_to edit_assign_path(:assign  => @assign, :assignable_type  => @assignable_type)
      end
    else
       flash[:error] = "verschachtelung zu tief oder falsch zugewiesen"
       redirect_to edit_assign_path(:assign  => @assign, :assignable_type  => @assignable_type)
    end
  end
  
  def destroy
    @assign = Assign.find(params[:id])
    @assignable_type = @assign.assignable_type
    @assign.destroy
    redirect_to assigns_url(:assignable_type  => @assignable_type)
  end
  
  def add_admin_assign_value
    @assign = Assign.find(params[:id]) 
    @assignable_type = @assign.assignable_type 
    @assign.admin_assign_values.build
    render :action  => 'new'
  end
  
  def set_user_assign_values
    
    unless UserAssignValue.find_all_by_assign_id_and_user_id(params[:select_many], current_user.id).nil?
      UserAssignValue.find_all_by_assign_id_and_user_id(params[:select_many], current_user.id).each do |user_assign|
        user_assign.destroy
      end
    end
    
    params_hash = find_assign_ids
    params_hash.each {|key, value| 
      unless value.to_s.size == 0
        if key.to_s.include?('_')
          key = key.split("_").first
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_user_id_and_value(key, current_user.id, AdminAssignValueName.find(value).name)
          user_assign_value.update_attribute(:value, AdminAssignValueName.find(value).name)
        else
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_user_id(key, current_user.id) 
          user_assign_value.update_attribute(:value, value)
        end
      end
    }
    redirect_to current_user
    
  end
  
  def find_assign_ids
    params_hash = Hash.new
    params.each do |name, value|
      if name.to_s.include?('assign_id')
        params_hash = params_hash.merge({name.match(/\d+/)[0], value.to_s[5, value.to_s.size]})
      end
      if name.to_s.include?('user_assign_collection')
        value.each {|elem| params_hash = params_hash.merge({name.match(/\d+/)[0] << "_" << elem.to_s, elem.to_s}) } 
      end
    end
    return params_hash
  end
  
end
