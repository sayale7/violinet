class PhotosController < ApplicationController
  # FIXME: Pass sessions through to allow cross-site forgery protection
  protect_from_forgery :except => :swfupload
  
  def index
    @photos = Photo.find_all_by_parent_id(nil)
  end
  
  def update
    @photo = Photo.find(params[:id])
    @type = params[:container_type].to_s
    if @photo.update_attribute("description", params[:description].to_s)
        @photos = Photo.find_all_by_photo_container_id_and_thumbnail(@photo.photo_container_id, nil)
        flash[:notice] = t("common.updated")
        respond_to do |format|
          format.html { redirect_to '/'+params[:container_type].to_s.downcase.pluralize+ '/' +@photo.photo_container_id.to_s+'/edit'}
          format.js
        end
    end
  end
  
  def new
    @user = current_user
    @photo = Photo.new
  end
  
  def create
    if params[:photo] 
      @photo = Photo.new(params[:photo])
      @photo.photo_container_type = params[:container_type].to_s.gsub('_','')
      @photo.photo_container_id = params[:container_id].to_s
      if @photo.save
        flash[:notice] = t("common.create_success")
        respond_to do |format|
          format.html { redirect_to '/'+params[:container_type].to_s.downcase.pluralize+ '/' +params[:container_id].to_s+'/edit'}
          format.js { }
        end
      end
    else
      redirect_to '/'+params[:container_type].to_s.downcase.pluralize+ '/' +params[:container_id].to_s+'/edit'
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
  end

  
  def destroy
    @photo = Photo.find(params[:id])
    photo = @photo
    @type = params[:container_type].to_s
    if @type.to_s.eql?('Photo_Album')
      @photo_album = PhotoAlbum.find(photo.photo_container_id)
    end
    if @type.to_s.eql?('Flat')
      @flat = Flat.find(photo.photo_container_id)
    end
    if @photo.destroy
      flash[:notice] = t("common.delete_success")
      @photos = Photo.find_all_by_photo_container_id_and_thumbnail(photo.photo_container_id, nil)
      respond_to do |format|
        format.html { redirect_to '/'+@type.downcase.pluralize+ '/' +photo.photo_container_id.to_s+'/edit'}
        format.js { }
      end
     
    end
  end
end
