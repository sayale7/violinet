class AssignsController < ApplicationController
  
  include AssignModule
  
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

    @params_hash = find_assign_ids
    
    find_and_save_user_values(current_user.id)
    
    redirect_to current_user

  end


  

  
end
