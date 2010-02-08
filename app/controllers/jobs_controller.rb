class JobsController < ApplicationController
  def index
    @jobs = Job.all(:order  => 'updated_at DESC', :limit  => 20)
    render :layout  => 'services'
  end
  
  def show
    @job = Job.find(params[:id])
    @_assigns = Assign.find_all_by_assignable_type('Job')
  end
  
  def new
    @job = Job.new
    is_admin?
  end
  
  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:notice] = "Successfully created job."
      redirect_to edit_job_path(@job)
    else
      render :layout  => 'services'
    end
  end
  
  def edit
    is_admin?
    @job = Job.find(params[:id])
    @not_in_job_tags = Tag.find_all_by_taggable_type('Job') - @job.tags
    render :layout  => 'services'
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = "Successfully updated job."
      redirect_to @job
    else
      render :layout  => 'services'
    end
  end
  
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:notice] = "Successfully destroyed job."
    redirect_to jobs_url
  end
  
  def add_tags
    @job = Job.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_or_create_by_tag_id_and_taggable_id_and_taggable_type(tag.id, @job.id, 'Job')
    end
    @not_in_job_tags = Tag.find_all_by_taggable_type('Job') - @job.tags
    # unauthorized! if cannot? :manage, @post
    respond_to do |format|
      format.html { redirect_to('/jobs/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  def remove_tags
    @job = Job.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_or_create_by_tag_id_and_taggable_id_and_taggable_type(tag.id, @job.id, 'Job').destroy
    end
    @not_in_job_tags = Tag.find_all_by_taggable_type('Job') - @job.tags
    # unauthorized! if cannot? :manage, @post
    respond_to do |format|
      format.html { redirect_to('/jobs/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  private
  
  def is_admin?
    @admin = false
    if current_user
      current_user.roles.each do |role|
        if role.name.to_s.eql?('admin')
          @admin = true
        end
      end
    end
  end
end
