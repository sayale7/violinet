class PhotosController < ApplicationController
  # FIXME: Pass sessions through to allow cross-site forgery protection
  protect_from_forgery :except => :swfupload
  
  def index
    @photos = Photo.find_all_by_parent_id(nil)
  end
  
  def update
    @photo = Photo.find(params[:id])
    photo_album = PhotoAlbum.find_by_id(@photo.photo_album_id)
    if @photo.update_attribute("description", params[:photo][:description])
        flash[:notice] = t("common.updated")
      redirect_to edit_photo_album_url(photo_album)
    end
  end
  
  def new
    @user = current_user
    @photo = Photo.new
  end
  
  def swfupload
    # swfupload action set in routes.rb
    @photo = Photo.new :uploaded_data => params[:Filedata]
    @photo.photo_album_id = (params[:token])
    #@photo.description = @photo.filename
    @photo.save!
    
    # This returns the thumbnail url for handlers.js to use to display the thumbnail
    render :text => @photo.public_filename(:thumb)
  rescue
    render :text => e
  end
  
  
  def destroy
    @photo = Photo.find(params[:id])
    photo_album = PhotoAlbum.find(@photo.photo_album_id)
    if @photo.destroy
      flash[:notice] = t("common.delete_success")
      redirect_to edit_photo_album_url(photo_album)
    end
  end
end
