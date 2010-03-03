class PhotosController < ApplicationController
  # FIXME: Pass sessions through to allow cross-site forgery protection
  protect_from_forgery :except => :swfupload
  
  def index
    @photos = Photo.find_all_by_parent_id(nil)
  end
  
  def update
    @photo = Photo.find(params[:id])
    @photo_album = PhotoAlbum.find_by_id(@photo.photo_container_id)
    if @photo.update_attribute("description", params[:photo][:description])
        flash[:notice] = t("common.updated")
        respond_to do |format|
          format.html { redirect_to edit_photo_album_url(@photo_album) }
          format.js
        end
    end
  end
  
  def new
    @user = current_user
    @photo = Photo.new
  end
  
  def create
    photo_album = PhotoAlbum.find(params[:photo][:photo_album_id])
    @photo = Photo.new(params[:photo])
    if @photo.save
      flash[:notice] = t("common.created")
      redirect_to edit_photo_album_url(photo_album)
    end
  end
  
  def swfupload
    # swfupload action set in routes.rb
    @photo = Photo.new :uploaded_data => params[:Filedata]
    @photo.photo_container_id = params[:token]
    @photo.photo_container_type = params[:type]
    #@photo.description = @photo.filename
    @photo.save
    
    # This returns the thumbnail url for handlers.js to use to display the thumbnail
    render :text => @photo.public_filename(:thumb)
  rescue
    logger.info ("photo error: " + e)
    render :text => e
  end
  
  def show
    destroy
  end
  
  
  def edit
    @photo = Photo.find(params[:id])
    unless params[:js].nil?
      render :layout  => 'layouts/popup'
    else  
      render  :layout => 'layouts/popup'
    end
  end

  
  def destroy
    @photo = Photo.find(params[:id])
    if @photo.destroy
      flash[:notice] = t("common.delete_success")
      redirect_to '/'+@photo.photo_container_type.to_s.downcase.pluralize+ '/' +@photo.photo_container_id.to_s+'/edit'
    end
  end
end
