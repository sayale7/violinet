class PhotoAlbumsController < ApplicationController
  
  def index
    @photo_ablums = PhotoAlbum.find_all_by_user_id(current_user)
  end
  
  def show
    @photo_ablum = PhotoAlbum.find(params[:id])
    @photos = Photo.find_all_by_photo_album_id_and_thumbnail(@photo_ablum.id, nil)
  end
  
  def new
    @photo_ablum = PhotoAlbum.new
  end
  
  def edit
    @user = current_user
    @photo_ablum = PhotoAlbum.find(params[:id])
    @photo = Photo.new
    @photos = Photo.find_all_by_photo_album_id_and_thumbnail(@photo_ablum.id, nil)
  end
  
  def create
    @photo_ablum = PhotoAlbum.new
    @photo_ablum.name = params[:photo_album][:name]
    @photo_ablum.description = params[:photo_album][:description]
    @photo_ablum.user_id = current_user.id
    
    respond_to do |format|
      if @photo_ablum.save
        flash[:notice] = t("common.created")
        format.html { redirect_to edit_photo_album_path(@photo_ablum) }
        format.xml  { render :xml => @photo_ablum, :status => :created, :location => @photo_ablum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo_ablum.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update_photo
    @photo = Photo.find(params[:id])
    @photo_ablum = PhotoAlbum.find(@photo.photo_album_id)
    respond_to do |format|
      format.html { redirect_to edit_photo_album_path(@photo_ablum) }
      format.js
    end
  end
  
  def update
    @photo_album = PhotoAlbum.find(params[:id])
    if @photo_album.update_attributes(params[:photo_album])
      flash[:notice] = t("common.updated")
      redirect_to edit_photo_album_path(@photo_album)
    end
  end
  
  def destroy
    @photo_album = PhotoAlbum.find(params[:id])
    if @photo_album.destroy
      redirect_to photo_albums_path
    end
  end
end
