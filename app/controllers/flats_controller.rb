class FlatsController < ApplicationController
  
  include AssignModule

  def index
    @flats = Flat.all('updated_at DESC', :limit  => 20)
    @tags = root_tags('Flat')
    if params[:flat_category] && !params[:flat_category].to_s.eql?('')
      taggings = Tagging.find_all_by_tag_id(params[:flat_category])
      flats = Array.new
      taggings.each do |tagging|
        flats = flats + Flat.find_all_by_id(tagging.taggable_id)
      end
      @flats = @flats & flats
      @tag = Tag.find(params[:flat_category])
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
    @flat = Flat.find(params[:id])
    @_assigns = Assign.find_all_by_assignable_type('Flat', :order  => 'position')
  end
  
  def new
    @flat = Flat.new
  end
  
  def create
    @flat = Flat.new(params[:flat])
    if @flat.save
      flash[:notice] = "Successfully created flat."
      redirect_to @flat
    else
      render :action => 'new'
    end
  end
  
  def edit
    @flat = Flat.find(params[:id])
    @not_in_flat_tags = Tag.find_all_by_taggable_type('Flat') - @flat.tags
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_container_id_and_thumbnail(@flat.id, nil)
  end
  
  def update
    @flat = Flat.find(params[:id])
    if @flat.update_attributes(params[:flat])
      flash[:notice] = "Successfully updated flat."
      redirect_to @flat
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    flash[:notice] = "Successfully destroyed flat."
    redirect_to flats_url
  end
  
  def set_flat_assign_values
    @params_hash = find_assign_ids

    if params[:title].to_s.eql?('') || params[:address].to_s.eql?('')
      if params[:flat_id].to_s.eql?("")
        flash[:error] = t('common.fill_in_duty')
        @flat = Flat.new
        @flat.title = params[:title]
        @flat.address = params[:address]
        render :action => 'new'
      else
        find_and_save_user_values(params[:flat_id])
        flash[:error] = t('common.fill_in_duty')
        redirect_to edit_flat_path(params[:flat_id])
      end
    else
      if params[:flat_id].to_s.eql?("")
        @is_new = false
        @flat = Flat.new
        @flat.title = params[:title]
        @flat.address = params[:address]
        if @flat.save
          params[:flat_id] = @flat.id
          @is_new = true
        else
          flash[:error] = t('common.fill_in_duty')
          render :action  => 'new'
        end
      else
        @is_new = false
        @flat = Flat.find(params[:flat_id])
        @flat.update_attribute('title', params[:title])
        @flat.update_attribute('address', params[:address])
      end

      unless UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], params[:flat_id]).nil?
        UserAssignValue.find_all_by_assign_id_and_assignable_id(params[:select_many], params[:flat_id]).each do |user_assign|
          user_assign.destroy
        end
      end


      find_and_save_user_values(params[:flat_id])

      unless params[:flat_id].to_s.eql?("")
        if @is_new
          redirect_to edit_flat_path(Flat.find(params[:flat_id]))
        else
          redirect_to flat_path(Flat.find(params[:flat_id]))
        end
      end
    end

  end
  
  def add_tags
    @flat = Flat.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_or_create_by_tag_id_and_taggable_id_and_taggable_type(tag.id, @flat.id, 'Flat')
    end
    @not_in_flat_tags = Tag.find_all_by_taggable_type('Flat') - @flat.tags
    # unauthorized! if cannot? :manage, @post
    respond_to do |format|
      format.html { redirect_to('/flats/' + params[:id].to_s + '/edit') }
      format.js
    end
  end

  def remove_tags
    @flat = Flat.find(params[:id])
    tags = Tag.find_all_by_id(params[:tags])
    tags.each do |tag|
      Tagging.find_or_create_by_tag_id_and_taggable_id_and_taggable_type(tag.id, @flat.id, 'Flat').destroy
    end
    @not_in_flat_tags = Tag.find_all_by_taggable_type('Flat') - @flat.tags
    # unauthorized! if cannot? :manage, @post
    respond_to do |format|
      format.html { redirect_to('/flats/' + params[:id].to_s + '/edit') }
      format.js
    end
  end
  
  
end
