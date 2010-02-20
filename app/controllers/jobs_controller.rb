class JobsController < ApplicationController

  include AssignModule

  def index
    @jobs = Job.all(:order  => 'active, updated_at DESC', :limit  => 20)
    @tags = root_tags
    if params[:job_category] && !params[:job_category].to_s.eql?('')
      taggings = Tagging.find_all_by_tag_id(params[:job_category])
      jobs = Array.new
      taggings.each do |tagging|
        jobs = jobs + Job.find_all_by_id(tagging.taggable_id)
      end
      @jobs = @jobs & jobs
      @tag = Tag.find(params[:job_category])
      @tags = @tag.children
    else
      @tag = ''
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @job = Job.find(params[:id])
    @_assigns = Assign.find_all_by_assignable_type('Job', :order  => 'position')
  end

  def new
    @job = Job.new
  end

  def create
    params[:job][:puplish_date] = params[:job][:puplish_date].to_date
    @job = Job.new(params[:job])
    @job.active = false
    if @job.save
      redirect_to edit_job_url(@job)
    else
      redirect_to edit_job_url(@job)
    end  
  end

  def edit
    @job = Job.find(params[:id])
    @not_in_job_tags = Tag.find_all_by_taggable_type('Job') - @job.tags
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      flash[:notice] = "Successfully updated job."
      redirect_to @job
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

  def set_job_assign_values
    @params_hash = find_assign_ids

    if params[:title].to_s.eql?('') || params[:puplish_date].to_s.eql?('')
      if params[:job_id].to_s.eql?("")
        flash[:error] = t('common.fill_in_duty')
        @job = Job.new
        @job.active = params[:active]
        @job.title = params[:title]
        @job.puplish_date = params[:puplish_date]
        render :action => 'new'
      else
        find_and_save_user_values(params[:job_id])
        flash[:error] = t('common.fill_in_duty')
        redirect_to edit_job_path(params[:job_id])
      end
    else
      if params[:job_id].to_s.eql?("")
        @is_new = false
        @job = Job.new
        @job.active = params[:active]
        @job.title = params[:title]
        @job.puplish_date = params[:puplish_date]
        if @job.save
          params[:job_id] = @job.id
          @is_new = true
        else
          flash[:error] = t('common.fill_in_duty')
          render :action  => 'new'
        end
      else
        @is_new = false
        @job = Job.find(params[:job_id])
        @job.update_attributes('active'  => params[:active], 'title'  => params[:title], 'puplish_date'  => params[:puplish_date])
      end

      unless UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], params[:job_id]).nil?
        UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], params[:job_id]).each do |user_assign|
          user_assign.destroy
        end
      end


      find_and_save_user_values(params[:job_id])

      unless params[:job_id].to_s.eql?("")
        if @is_new
          redirect_to edit_job_path(Job.find(params[:job_id]))
        else
          redirect_to job_path(Job.find(params[:job_id]))
        end
      end
    end

  end


end
