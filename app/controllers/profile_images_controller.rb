class ProfileImagesController < ApplicationController


  def new
    unless params[:edit].eql?('true')
      @profile_image = ProfileImage.find_by_user_id(current_user.id)
    else
      @profile_image = ProfileImage.find_by_user_id(current_user.id)
      render :action  => 'crop'
    end
  end
  
  def create
    @profile_image = ProfileImage.find_by_user_id(current_user.id)
    unless @profile_image.nil?
      @profile_image.destroy
    end
    @profile_image = ProfileImage.new(params[:profile_image])
    if @profile_image.save
      if params[:profile_image][:avatar].blank?
        flash[:notice] = t('profile_image.created')
        redirect_to @profile_image
      else
        debugger
        render :action => "crop"
      end
    else
      render :action => 'new'
    end
  end

  def update
    @profile_image = ProfileImage.find_by_user_id(current_user.id)
    if @profile_image.update_attributes(params[:profile_image])
      if params[:profile_image][:avatar].blank?
        flash[:notice] = t('profile_image.created')
        @user = User.find(@profile_image.user_id)
        redirect_to @user
      else
        render :action => "crop"
      end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    #TODO
  end
  
end