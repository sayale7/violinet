class ProfileImagesController < ApplicationController
  
  access_control do
    allow logged_in
  end
  
  def new
    @profile_image = ProfileImage.new
  end
  
  def create
    if ProfileImage.find_by_user_id(current_user) != nil
      profile_image = ProfileImage.find_by_user_id(current_user)
      profile_image.destroy
    end
    @profile_image = ProfileImage.new(params[:profile_image])
    if @profile_image.save
        flash[:notice] = t("common.created")
      redirect_to edit_account_url
    else
      render :action => :new
    end
  end
  
  def destroy
    #TODO
  end
end