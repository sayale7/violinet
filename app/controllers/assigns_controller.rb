class AssignsController < ApplicationController
  
  def index
    unless params[:assignable_type].nil?
      @assignable_type =  params[:assignable_type]
    end
    @_assigns = Assign.find_all_by_assignable_type_and_parent_id(@assignable_type, nil)
  end
  
  def show
    @assign = Assign.find(params[:id])
    render :layout  =>  '/layouts/' + @assign.assignable_type.to_s.downcase.pluralize
  end
  
  def new
    @assign = Assign.new
    @assign.html_attribute = 'text_field'
    @assignable_type =  params[:assignable_type]
    @_assigns = Assign.find_all_by_assignable_type_and_parent_id(@assignable_type, nil)
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
    @_assigns = Assign.find_all_by_assignable_type_and_parent_id(@assignable_type, nil)
  end
  
  def update
    @assign = Assign.find(params[:id])
    @assignable_type = @assign.assignable_type
    test_assign = Assign.new
    test_assign.parent_id = params[:assign][:parent_id]
    unless params[:assign][:parent_id].eql?(@assign.id.to_s) || (test_assign.parent.parent_id != nil unless test_assign.parent.nil?)
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
    @_assigns = Assign.find_all_by_assignable_type_and_parent_id(@assignable_type, nil)
    render :action  => 'new'
  end
  
  def set_user_assign_values
    
    unless UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], current_user.id).nil?
      UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], current_user.id).each do |user_assign|
        user_assign.destroy
      end
    end
    
    params_hash = find_assign_ids
    params_hash.each {|key, value| 
      unless value.to_s.size == 0
        if key.to_s.include?('_')
          key = key.split("_").first
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_assignable_id_and_value_and_admin_assign_value_id(key, current_user.id, AdminAssignValueName.find(value).name, AdminAssignValueName.find(value).admin_assign_value_id)
          user_assign_value.update_attribute(:value, AdminAssignValueName.find(value).name)
        else
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_assignable_id(key, current_user.id) 
          user_assign_value.update_attribute(:value, value)
        end
      end
    }
    redirect_to current_user
    
  end
  
  def set_job_assign_values
    
    if params[:job_id].to_s.eql?("")
      @is_new = false
      @job = Job.new
      @job.active = params[:active]
      @job.title = params[:title]
      if @job.save
        params[:job_id] = @job.id
        @is_new = true
      else
        render :action => 'new'
      end
    else
      @is_new = false
      @job = Job.find(params[:job_id])
      @job.update_attributes('active'  => params[:active], 'title'  => params[:title])
    end
    
    unless UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], params[:job_id]).nil?
      UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], params[:job_id]).each do |user_assign|
        user_assign.destroy
      end
    end
    
    params_hash = find_assign_ids
    params_hash.each {|key, value| 
      unless value.to_s.size == 0
        if key.to_s.include?('_')
          key = key.split("_").first
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_assignable_id_and_value_and_admin_assign_value_id(key,  params[:job_id], AdminAssignValueName.find(value).name, AdminAssignValueName.find(value).admin_assign_value_id)
          user_assign_value.update_attribute(:value, AdminAssignValueName.find(value).name)
        else
          user_assign_value = UserAssignValue.find_or_create_by_assign_id_and_assignable_id(key, params[:job_id]) 
          user_assign_value.update_attribute(:value, value)
        end
      end
    }
    if @is_new
      redirect_to edit_job_path(Job.find(params[:job_id]))
    else
      redirect_to job_path(Job.find(params[:job_id]))
    end
    
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
